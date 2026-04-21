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

@DriftDatabase(tables: [Preferences])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'pray_db',
      native: const DriftNativeOptions(
        databasePath: getDatabasePath,
      ),
    );
  }

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
}

Future<String> getDatabasePath() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  return p.join(dbFolder.path, 'pray.db');
}
