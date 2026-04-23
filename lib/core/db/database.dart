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

@DriftDatabase(tables: [Preferences, Prayers, JournalEntries, PrayerActivity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

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
}

Future<String> getDatabasePath() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  return p.join(dbFolder.path, 'pray.db');
}
