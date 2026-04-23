import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Preferences extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

class Prayers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get category => text()();
  TextColumn get status => text()(); // 'unanswered', 'active', 'answered'
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get answeredAt => dateTime().nullable()();
}

class JournalEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get category => text()();
  TextColumn get mood => text().nullable()();
  IntColumn get relatedPrayerId => integer().nullable().references(Prayers, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class PrayerActivity extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get prayed => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => ['UNIQUE(date)'];
}

class DashboardBlocks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // 'counter', 'streak', 'chart', 'list', 'category', 'rate', 'reminder', 'goals'
  IntColumn get position => integer().withDefault(const Constant(0))();
  TextColumn get settings => text().nullable()(); // JSON-encoded settings for the block
}

class PrayerReminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get scheduledTime => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PrayerGoals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  IntColumn get targetCount => integer()(); // e.g., pray 100 times
  IntColumn get currentCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get deadline => dateTime().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PrayerTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get color => text().nullable()(); // hex color like "#FF5733"
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => ['UNIQUE(name)'];
}

class PrayerTagRelations extends Table {
  IntColumn get prayerId => integer().references(Prayers, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId => integer().references(PrayerTags, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {prayerId, tagId};
}

@DriftDatabase(tables: [Preferences, Prayers, JournalEntries, PrayerActivity, DashboardBlocks, PrayerReminders, PrayerGoals, PrayerTags, PrayerTagRelations])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(prayers);
        await m.createTable(journalEntries);
        await m.createTable(prayerActivity);
      }
      if (from < 3) {
        await m.createTable(dashboardBlocks);
      }
      if (from < 4) {
        await m.createTable(prayerReminders);
        await m.createTable(prayerGoals);
      }
      if (from < 5) {
        await m.createTable(prayerTags);
        await m.createTable(prayerTagRelations);
      }
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'pray_db',
      native: const DriftNativeOptions(
        databasePath: getDatabasePath,
      ),
    );
  }

  // Preferences
  Future<String?> getPreference(String key) async {
    final result = await (select(preferences)..where((p) => p.key.equals(key))).getSingleOrNull();
    return result?.value;
  }

  Future<void> setPreference(String key, String value) async {
    await into(preferences).insertOnConflictUpdate(
      PreferencesCompanion(
        key: Value(key),
        value: Value(value),
      ),
    );
  }

  // Prayers
  Future<List<Prayer>> getAllPrayers() => select(prayers).get();

  Future<List<Prayer>> getPrayersByStatus(String status) =>
      (select(prayers)..where((p) => p.status.equals(status))).get();

  Future<Prayer?> getPrayer(int id) =>
      (select(prayers)..where((p) => p.id.equals(id))).getSingleOrNull();

  Future<int> insertPrayer(PrayersCompanion prayer) => into(prayers).insert(prayer);

  Future<bool> updatePrayer(Prayer prayer) => update(prayers).replace(prayer);

  Future<int> deletePrayer(int id) =>
      (delete(prayers)..where((p) => p.id.equals(id))).go();

  Future<List<Prayer>> getFuturePrayers(DateTime fromDate) async {
    final fromDateOnly = DateTime(fromDate.year, fromDate.month, fromDate.day);
    return (select(prayers)
          ..where((p) => p.createdAt.isBiggerOrEqualValue(fromDateOnly)))
        .get();
  }

  Future<int> markPrayerAnswered(int id) async {
    final prayer = await getPrayer(id);
    if (prayer == null) return 0;
    final result = await update(prayers).replace(
      prayer.copyWith(
        status: 'answered',
        answeredAt: Value(DateTime.now()),
        updatedAt: DateTime.now(),
      ),
    );
    return result ? 1 : 0;
  }

  Future<Map<String, int>> getPrayerStats() async {
    final allPrayers = await getAllPrayers();
    return {
      'total': allPrayers.length,
      'answered': allPrayers.where((p) => p.status == 'answered').length,
      'unanswered': allPrayers.where((p) => p.status == 'unanswered').length,
      'active': allPrayers.where((p) => p.status == 'active').length,
    };
  }

  // Journal Entries
  Future<List<JournalEntry>> getAllJournalEntries() =>
      select(journalEntries).get();

  Future<JournalEntry?> getJournalEntry(int id) =>
      (select(journalEntries)..where((e) => e.id.equals(id))).getSingleOrNull();

  Future<int> insertJournalEntry(JournalEntriesCompanion entry) =>
      into(journalEntries).insert(entry);

  Future<bool> updateJournalEntry(JournalEntry entry) =>
      update(journalEntries).replace(entry);

  Future<int> deleteJournalEntry(int id) =>
      (delete(journalEntries)..where((e) => e.id.equals(id))).go();

  Future<List<JournalEntry>> getFutureJournalEntries(DateTime fromDate) async {
    final fromDateOnly = DateTime(fromDate.year, fromDate.month, fromDate.day);
    return (select(journalEntries)
          ..where((e) => e.createdAt.isBiggerOrEqualValue(fromDateOnly)))
        .get();
  }

  // Prayer Activity (for streak tracking)
  Future<List<PrayerActivityData>> getPrayerActivityForRange(DateTime start, DateTime end) async {
    final startDate = DateTime(start.year, start.month, start.day);
    final endDate = DateTime(end.year, end.month, end.day, 23, 59, 59);
    return (select(prayerActivity)
          ..where((a) => a.date.isBetweenValues(startDate, endDate)))
        .get();
  }

  Future<PrayerActivityData?> getPrayerActivityForDate(DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return (select(prayerActivity)
          ..where((a) => a.date.equals(dateOnly)))
        .getSingleOrNull();
  }

  Future<void> recordPrayerActivity(DateTime date, {bool prayed = true}) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    await into(prayerActivity).insertOnConflictUpdate(
      PrayerActivityCompanion(
        date: Value(dateOnly),
        prayed: Value(prayed),
      ),
    );
  }

  Future<int> getCurrentStreak() async {
    final now = DateTime.now();
    var streak = 0;
    var checkDate = DateTime(now.year, now.month, now.day);

    while (true) {
      final activity = await getPrayerActivityForDate(checkDate);
      if (activity == null || !activity.prayed) {
        // If today has no activity yet, check yesterday
        if (streak == 0 && checkDate == DateTime(now.year, now.month, now.day)) {
          checkDate = checkDate.subtract(const Duration(days: 1));
          continue;
        }
        break;
      }
      streak++;
      checkDate = checkDate.subtract(const Duration(days: 1));
    }

    return streak;
  }

  // Clear all data
  Future<void> clearAllData() async {
    await delete(prayers).go();
    await delete(journalEntries).go();
    await delete(prayerActivity).go();
    await delete(preferences).go();
    await delete(dashboardBlocks).go();
    await delete(prayerReminders).go();
    await delete(prayerGoals).go();
    await delete(prayerTagRelations).go();
    await delete(prayerTags).go();
  }

  // Prayer Tags
  Future<List<PrayerTag>> getAllTags() => select(prayerTags).get();

  Future<int> insertTag(PrayerTagsCompanion tag) => into(prayerTags).insert(tag);

  Future<bool> updateTag(PrayerTag tag) => update(prayerTags).replace(tag);

  Future<int> deleteTag(int id) =>
      (delete(prayerTags)..where((t) => t.id.equals(id))).go();

  // Prayer-Tag Relations
  Future<List<PrayerTag>> getTagsForPrayer(int prayerId) async {
    final query = select(prayerTags).join([
      innerJoin(
        prayerTagRelations,
        prayerTagRelations.tagId.equalsExp(prayerTags.id),
      ),
    ])
      ..where(prayerTagRelations.prayerId.equals(prayerId));

    return query.map((row) => row.readTable(prayerTags)).get();
  }

  Future<List<Prayer>> getPrayersForTag(int tagId) async {
    final query = select(prayers).join([
      innerJoin(
        prayerTagRelations,
        prayerTagRelations.prayerId.equalsExp(prayers.id),
      ),
    ])
      ..where(prayerTagRelations.tagId.equals(tagId));

    return query.map((row) => row.readTable(prayers)).get();
  }

  Future<void> addTagToPrayer(int prayerId, int tagId) async {
    await into(prayerTagRelations).insertOnConflictUpdate(
      PrayerTagRelationsCompanion(
        prayerId: Value(prayerId),
        tagId: Value(tagId),
      ),
    );
  }

  Future<void> removeTagFromPrayer(int prayerId, int tagId) async {
    await (delete(prayerTagRelations)
          ..where((r) => r.prayerId.equals(prayerId) & r.tagId.equals(tagId)))
        .go();
  }

  Future<void> setPrayerTags(int prayerId, List<int> tagIds) async {
    // Remove existing tags
    await (delete(prayerTagRelations)
          ..where((r) => r.prayerId.equals(prayerId)))
        .go();
    // Add new tags
    for (final tagId in tagIds) {
      await into(prayerTagRelations).insert(
        PrayerTagRelationsCompanion(
          prayerId: Value(prayerId),
          tagId: Value(tagId),
        ),
      );
    }
  }

  // Prayer Reminders
  Future<List<PrayerReminder>> getActiveReminders() =>
      (select(prayerReminders)..where((r) => r.isActive.equals(true))).get();

  Future<int> getActiveReminderCount() async {
    final reminders = await getActiveReminders();
    return reminders.length;
  }

  Future<int> insertPrayerReminder(PrayerRemindersCompanion reminder) =>
      into(prayerReminders).insert(reminder);

  Future<bool> updatePrayerReminder(PrayerReminder reminder) =>
      update(prayerReminders).replace(reminder);

  Future<int> deletePrayerReminder(int id) =>
      (delete(prayerReminders)..where((r) => r.id.equals(id))).go();

  // Prayer Goals
  Future<List<PrayerGoal>> getActiveGoals() =>
      (select(prayerGoals)..where((g) => g.isCompleted.equals(false))).get();

  Future<int> getActiveGoalCount() async {
    final goals = await getActiveGoals();
    return goals.length;
  }

  Future<int> insertPrayerGoal(PrayerGoalsCompanion goal) =>
      into(prayerGoals).insert(goal);

  Future<bool> updatePrayerGoal(PrayerGoal goal) =>
      update(prayerGoals).replace(goal);

  Future<int> deletePrayerGoal(int id) =>
      (delete(prayerGoals)..where((g) => g.id.equals(id))).go();

  Future<void> incrementGoalProgress(int goalId) async {
    final goal = await (select(prayerGoals)..where((g) => g.id.equals(goalId))).getSingle();
    final newCount = goal.currentCount + 1;
    final isCompleted = newCount >= goal.targetCount;
    await update(prayerGoals).replace(
      goal.copyWith(
        currentCount: newCount,
        isCompleted: isCompleted,
      ),
    );
  }

  // Dashboard Blocks
  Future<List<DashboardBlock>> getAllDashboardBlocks() =>
      (select(dashboardBlocks)..orderBy([(b) => OrderingTerm(expression: b.position)])).get();

  Future<int> insertDashboardBlock(DashboardBlocksCompanion block) =>
      into(dashboardBlocks).insert(block);

  Future<bool> updateDashboardBlock(DashboardBlock block) =>
      update(dashboardBlocks).replace(block);

  Future<int> deleteDashboardBlock(int id) =>
      (delete(dashboardBlocks)..where((b) => b.id.equals(id))).go();

  Future<void> reorderDashboardBlocks(List<DashboardBlock> blocks) async {
    await batch((batch) {
      for (var i = 0; i < blocks.length; i++) {
        batch.update(
          dashboardBlocks,
          DashboardBlocksCompanion(position: Value(i)),
          where: (b) => b.id.equals(blocks[i].id),
        );
      }
    });
  }
}

Future<String> getDatabasePath() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  return p.join(dbFolder.path, 'pray.db');
}
