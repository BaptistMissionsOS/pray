// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PreferencesTable extends Preferences
    with TableInfo<$PreferencesTable, Preference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<Preference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Preference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Preference(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $PreferencesTable createAlias(String alias) {
    return $PreferencesTable(attachedDatabase, alias);
  }
}

class Preference extends DataClass implements Insertable<Preference> {
  final String key;
  final String value;
  const Preference({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  PreferencesCompanion toCompanion(bool nullToAbsent) {
    return PreferencesCompanion(key: Value(key), value: Value(value));
  }

  factory Preference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Preference(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Preference copyWith({String? key, String? value}) =>
      Preference(key: key ?? this.key, value: value ?? this.value);
  Preference copyWithCompanion(PreferencesCompanion data) {
    return Preference(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Preference(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Preference &&
          other.key == this.key &&
          other.value == this.value);
}

class PreferencesCompanion extends UpdateCompanion<Preference> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const PreferencesCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferencesCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Preference> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PreferencesCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return PreferencesCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrayersTable extends Prayers with TableInfo<$PrayersTable, Prayer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _answeredAtMeta = const VerificationMeta(
    'answeredAt',
  );
  @override
  late final GeneratedColumn<DateTime> answeredAt = GeneratedColumn<DateTime>(
    'answered_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    category,
    status,
    createdAt,
    updatedAt,
    answeredAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Prayer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('answered_at')) {
      context.handle(
        _answeredAtMeta,
        answeredAt.isAcceptableOrUnknown(data['answered_at']!, _answeredAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Prayer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Prayer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      answeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}answered_at'],
      ),
    );
  }

  @override
  $PrayersTable createAlias(String alias) {
    return $PrayersTable(attachedDatabase, alias);
  }
}

class Prayer extends DataClass implements Insertable<Prayer> {
  final int id;
  final String title;
  final String? description;
  final String category;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? answeredAt;
  const Prayer({
    required this.id,
    required this.title,
    this.description,
    required this.category,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.answeredAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['category'] = Variable<String>(category);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || answeredAt != null) {
      map['answered_at'] = Variable<DateTime>(answeredAt);
    }
    return map;
  }

  PrayersCompanion toCompanion(bool nullToAbsent) {
    return PrayersCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: Value(category),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      answeredAt: answeredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(answeredAt),
    );
  }

  factory Prayer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Prayer(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      answeredAt: serializer.fromJson<DateTime?>(json['answeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String>(category),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'answeredAt': serializer.toJson<DateTime?>(answeredAt),
    };
  }

  Prayer copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    String? category,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> answeredAt = const Value.absent(),
  }) => Prayer(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    category: category ?? this.category,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    answeredAt: answeredAt.present ? answeredAt.value : this.answeredAt,
  );
  Prayer copyWithCompanion(PrayersCompanion data) {
    return Prayer(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      answeredAt: data.answeredAt.present
          ? data.answeredAt.value
          : this.answeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Prayer(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    category,
    status,
    createdAt,
    updatedAt,
    answeredAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Prayer &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.category == this.category &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.answeredAt == this.answeredAt);
}

class PrayersCompanion extends UpdateCompanion<Prayer> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> category;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> answeredAt;
  const PrayersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.answeredAt = const Value.absent(),
  });
  PrayersCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required String category,
    required String status,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.answeredAt = const Value.absent(),
  }) : title = Value(title),
       category = Value(category),
       status = Value(status);
  static Insertable<Prayer> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? answeredAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (answeredAt != null) 'answered_at': answeredAt,
    });
  }

  PrayersCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? category,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? answeredAt,
  }) {
    return PrayersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      answeredAt: answeredAt ?? this.answeredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(answeredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<String> mood = GeneratedColumn<String>(
    'mood',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedPrayerIdMeta = const VerificationMeta(
    'relatedPrayerId',
  );
  @override
  late final GeneratedColumn<int> relatedPrayerId = GeneratedColumn<int>(
    'related_prayer_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES prayers (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    content,
    category,
    mood,
    relatedPrayerId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('related_prayer_id')) {
      context.handle(
        _relatedPrayerIdMeta,
        relatedPrayerId.isAcceptableOrUnknown(
          data['related_prayer_id']!,
          _relatedPrayerIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood'],
      ),
      relatedPrayerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}related_prayer_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }
}

class JournalEntry extends DataClass implements Insertable<JournalEntry> {
  final int id;
  final String title;
  final String content;
  final String category;
  final String? mood;
  final int? relatedPrayerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const JournalEntry({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    this.mood,
    this.relatedPrayerId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<String>(mood);
    }
    if (!nullToAbsent || relatedPrayerId != null) {
      map['related_prayer_id'] = Variable<int>(relatedPrayerId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      category: Value(category),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      relatedPrayerId: relatedPrayerId == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedPrayerId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory JournalEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntry(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<String>(json['category']),
      mood: serializer.fromJson<String?>(json['mood']),
      relatedPrayerId: serializer.fromJson<int?>(json['relatedPrayerId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<String>(category),
      'mood': serializer.toJson<String?>(mood),
      'relatedPrayerId': serializer.toJson<int?>(relatedPrayerId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  JournalEntry copyWith({
    int? id,
    String? title,
    String? content,
    String? category,
    Value<String?> mood = const Value.absent(),
    Value<int?> relatedPrayerId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => JournalEntry(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    category: category ?? this.category,
    mood: mood.present ? mood.value : this.mood,
    relatedPrayerId: relatedPrayerId.present
        ? relatedPrayerId.value
        : this.relatedPrayerId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  JournalEntry copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      category: data.category.present ? data.category.value : this.category,
      mood: data.mood.present ? data.mood.value : this.mood,
      relatedPrayerId: data.relatedPrayerId.present
          ? data.relatedPrayerId.value
          : this.relatedPrayerId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('mood: $mood, ')
          ..write('relatedPrayerId: $relatedPrayerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    content,
    category,
    mood,
    relatedPrayerId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category &&
          other.mood == this.mood &&
          other.relatedPrayerId == this.relatedPrayerId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntry> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> category;
  final Value<String?> mood;
  final Value<int?> relatedPrayerId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    this.mood = const Value.absent(),
    this.relatedPrayerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    required String category,
    this.mood = const Value.absent(),
    this.relatedPrayerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : title = Value(title),
       content = Value(content),
       category = Value(category);
  static Insertable<JournalEntry> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? category,
    Expression<String>? mood,
    Expression<int>? relatedPrayerId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (category != null) 'category': category,
      if (mood != null) 'mood': mood,
      if (relatedPrayerId != null) 'related_prayer_id': relatedPrayerId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  JournalEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? content,
    Value<String>? category,
    Value<String?>? mood,
    Value<int?>? relatedPrayerId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      mood: mood ?? this.mood,
      relatedPrayerId: relatedPrayerId ?? this.relatedPrayerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(mood.value);
    }
    if (relatedPrayerId.present) {
      map['related_prayer_id'] = Variable<int>(relatedPrayerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('mood: $mood, ')
          ..write('relatedPrayerId: $relatedPrayerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PrayerActivityTable extends PrayerActivity
    with TableInfo<$PrayerActivityTable, PrayerActivityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerActivityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prayedMeta = const VerificationMeta('prayed');
  @override
  late final GeneratedColumn<bool> prayed = GeneratedColumn<bool>(
    'prayed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("prayed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, prayed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_activity';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerActivityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('prayed')) {
      context.handle(
        _prayedMeta,
        prayed.isAcceptableOrUnknown(data['prayed']!, _prayedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerActivityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerActivityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      prayed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}prayed'],
      )!,
    );
  }

  @override
  $PrayerActivityTable createAlias(String alias) {
    return $PrayerActivityTable(attachedDatabase, alias);
  }
}

class PrayerActivityData extends DataClass
    implements Insertable<PrayerActivityData> {
  final int id;
  final DateTime date;
  final bool prayed;
  const PrayerActivityData({
    required this.id,
    required this.date,
    required this.prayed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['prayed'] = Variable<bool>(prayed);
    return map;
  }

  PrayerActivityCompanion toCompanion(bool nullToAbsent) {
    return PrayerActivityCompanion(
      id: Value(id),
      date: Value(date),
      prayed: Value(prayed),
    );
  }

  factory PrayerActivityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerActivityData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      prayed: serializer.fromJson<bool>(json['prayed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'prayed': serializer.toJson<bool>(prayed),
    };
  }

  PrayerActivityData copyWith({int? id, DateTime? date, bool? prayed}) =>
      PrayerActivityData(
        id: id ?? this.id,
        date: date ?? this.date,
        prayed: prayed ?? this.prayed,
      );
  PrayerActivityData copyWithCompanion(PrayerActivityCompanion data) {
    return PrayerActivityData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      prayed: data.prayed.present ? data.prayed.value : this.prayed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerActivityData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('prayed: $prayed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, prayed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerActivityData &&
          other.id == this.id &&
          other.date == this.date &&
          other.prayed == this.prayed);
}

class PrayerActivityCompanion extends UpdateCompanion<PrayerActivityData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<bool> prayed;
  const PrayerActivityCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.prayed = const Value.absent(),
  });
  PrayerActivityCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.prayed = const Value.absent(),
  }) : date = Value(date);
  static Insertable<PrayerActivityData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<bool>? prayed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (prayed != null) 'prayed': prayed,
    });
  }

  PrayerActivityCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<bool>? prayed,
  }) {
    return PrayerActivityCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      prayed: prayed ?? this.prayed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (prayed.present) {
      map['prayed'] = Variable<bool>(prayed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerActivityCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('prayed: $prayed')
          ..write(')'))
        .toString();
  }
}

class $DashboardBlocksTable extends DashboardBlocks
    with TableInfo<$DashboardBlocksTable, DashboardBlock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DashboardBlocksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _settingsMeta = const VerificationMeta(
    'settings',
  );
  @override
  late final GeneratedColumn<String> settings = GeneratedColumn<String>(
    'settings',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, type, position, settings];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dashboard_blocks';
  @override
  VerificationContext validateIntegrity(
    Insertable<DashboardBlock> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    }
    if (data.containsKey('settings')) {
      context.handle(
        _settingsMeta,
        settings.isAcceptableOrUnknown(data['settings']!, _settingsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DashboardBlock map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DashboardBlock(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      settings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}settings'],
      ),
    );
  }

  @override
  $DashboardBlocksTable createAlias(String alias) {
    return $DashboardBlocksTable(attachedDatabase, alias);
  }
}

class DashboardBlock extends DataClass implements Insertable<DashboardBlock> {
  final int id;
  final String type;
  final int position;
  final String? settings;
  const DashboardBlock({
    required this.id,
    required this.type,
    required this.position,
    this.settings,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['position'] = Variable<int>(position);
    if (!nullToAbsent || settings != null) {
      map['settings'] = Variable<String>(settings);
    }
    return map;
  }

  DashboardBlocksCompanion toCompanion(bool nullToAbsent) {
    return DashboardBlocksCompanion(
      id: Value(id),
      type: Value(type),
      position: Value(position),
      settings: settings == null && nullToAbsent
          ? const Value.absent()
          : Value(settings),
    );
  }

  factory DashboardBlock.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DashboardBlock(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      position: serializer.fromJson<int>(json['position']),
      settings: serializer.fromJson<String?>(json['settings']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'position': serializer.toJson<int>(position),
      'settings': serializer.toJson<String?>(settings),
    };
  }

  DashboardBlock copyWith({
    int? id,
    String? type,
    int? position,
    Value<String?> settings = const Value.absent(),
  }) => DashboardBlock(
    id: id ?? this.id,
    type: type ?? this.type,
    position: position ?? this.position,
    settings: settings.present ? settings.value : this.settings,
  );
  DashboardBlock copyWithCompanion(DashboardBlocksCompanion data) {
    return DashboardBlock(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      position: data.position.present ? data.position.value : this.position,
      settings: data.settings.present ? data.settings.value : this.settings,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DashboardBlock(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('position: $position, ')
          ..write('settings: $settings')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, position, settings);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DashboardBlock &&
          other.id == this.id &&
          other.type == this.type &&
          other.position == this.position &&
          other.settings == this.settings);
}

class DashboardBlocksCompanion extends UpdateCompanion<DashboardBlock> {
  final Value<int> id;
  final Value<String> type;
  final Value<int> position;
  final Value<String?> settings;
  const DashboardBlocksCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.position = const Value.absent(),
    this.settings = const Value.absent(),
  });
  DashboardBlocksCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    this.position = const Value.absent(),
    this.settings = const Value.absent(),
  }) : type = Value(type);
  static Insertable<DashboardBlock> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<int>? position,
    Expression<String>? settings,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (position != null) 'position': position,
      if (settings != null) 'settings': settings,
    });
  }

  DashboardBlocksCompanion copyWith({
    Value<int>? id,
    Value<String>? type,
    Value<int>? position,
    Value<String?>? settings,
  }) {
    return DashboardBlocksCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      position: position ?? this.position,
      settings: settings ?? this.settings,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (settings.present) {
      map['settings'] = Variable<String>(settings.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DashboardBlocksCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('position: $position, ')
          ..write('settings: $settings')
          ..write(')'))
        .toString();
  }
}

class $PrayerRemindersTable extends PrayerReminders
    with TableInfo<$PrayerRemindersTable, PrayerReminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerRemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scheduledTimeMeta = const VerificationMeta(
    'scheduledTime',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledTime =
      GeneratedColumn<DateTime>(
        'scheduled_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    scheduledTime,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerReminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
        _scheduledTimeMeta,
        scheduledTime.isAcceptableOrUnknown(
          data['scheduled_time']!,
          _scheduledTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerReminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerReminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      scheduledTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_time'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PrayerRemindersTable createAlias(String alias) {
    return $PrayerRemindersTable(attachedDatabase, alias);
  }
}

class PrayerReminder extends DataClass implements Insertable<PrayerReminder> {
  final int id;
  final String title;
  final String? description;
  final DateTime scheduledTime;
  final bool isActive;
  final DateTime createdAt;
  const PrayerReminder({
    required this.id,
    required this.title,
    this.description,
    required this.scheduledTime,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['scheduled_time'] = Variable<DateTime>(scheduledTime);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PrayerRemindersCompanion toCompanion(bool nullToAbsent) {
    return PrayerRemindersCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      scheduledTime: Value(scheduledTime),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory PrayerReminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerReminder(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      scheduledTime: serializer.fromJson<DateTime>(json['scheduledTime']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'scheduledTime': serializer.toJson<DateTime>(scheduledTime),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PrayerReminder copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    DateTime? scheduledTime,
    bool? isActive,
    DateTime? createdAt,
  }) => PrayerReminder(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    scheduledTime: scheduledTime ?? this.scheduledTime,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  PrayerReminder copyWithCompanion(PrayerRemindersCompanion data) {
    return PrayerReminder(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      scheduledTime: data.scheduledTime.present
          ? data.scheduledTime.value
          : this.scheduledTime,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerReminder(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, scheduledTime, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerReminder &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.scheduledTime == this.scheduledTime &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class PrayerRemindersCompanion extends UpdateCompanion<PrayerReminder> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime> scheduledTime;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const PrayerRemindersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PrayerRemindersCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required DateTime scheduledTime,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       scheduledTime = Value(scheduledTime);
  static Insertable<PrayerReminder> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? scheduledTime,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PrayerRemindersCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<DateTime>? scheduledTime,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return PrayerRemindersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<DateTime>(scheduledTime.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerRemindersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PrayerGoalsTable extends PrayerGoals
    with TableInfo<$PrayerGoalsTable, PrayerGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetCountMeta = const VerificationMeta(
    'targetCount',
  );
  @override
  late final GeneratedColumn<int> targetCount = GeneratedColumn<int>(
    'target_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentCountMeta = const VerificationMeta(
    'currentCount',
  );
  @override
  late final GeneratedColumn<int> currentCount = GeneratedColumn<int>(
    'current_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    targetCount,
    currentCount,
    deadline,
    isCompleted,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('target_count')) {
      context.handle(
        _targetCountMeta,
        targetCount.isAcceptableOrUnknown(
          data['target_count']!,
          _targetCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetCountMeta);
    }
    if (data.containsKey('current_count')) {
      context.handle(
        _currentCountMeta,
        currentCount.isAcceptableOrUnknown(
          data['current_count']!,
          _currentCountMeta,
        ),
      );
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerGoal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      targetCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_count'],
      )!,
      currentCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_count'],
      )!,
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      ),
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PrayerGoalsTable createAlias(String alias) {
    return $PrayerGoalsTable(attachedDatabase, alias);
  }
}

class PrayerGoal extends DataClass implements Insertable<PrayerGoal> {
  final int id;
  final String title;
  final String? description;
  final int targetCount;
  final int currentCount;
  final DateTime? deadline;
  final bool isCompleted;
  final DateTime createdAt;
  const PrayerGoal({
    required this.id,
    required this.title,
    this.description,
    required this.targetCount,
    required this.currentCount,
    this.deadline,
    required this.isCompleted,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['target_count'] = Variable<int>(targetCount);
    map['current_count'] = Variable<int>(currentCount);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PrayerGoalsCompanion toCompanion(bool nullToAbsent) {
    return PrayerGoalsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      targetCount: Value(targetCount),
      currentCount: Value(currentCount),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      isCompleted: Value(isCompleted),
      createdAt: Value(createdAt),
    );
  }

  factory PrayerGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerGoal(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      targetCount: serializer.fromJson<int>(json['targetCount']),
      currentCount: serializer.fromJson<int>(json['currentCount']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'targetCount': serializer.toJson<int>(targetCount),
      'currentCount': serializer.toJson<int>(currentCount),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PrayerGoal copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    int? targetCount,
    int? currentCount,
    Value<DateTime?> deadline = const Value.absent(),
    bool? isCompleted,
    DateTime? createdAt,
  }) => PrayerGoal(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    targetCount: targetCount ?? this.targetCount,
    currentCount: currentCount ?? this.currentCount,
    deadline: deadline.present ? deadline.value : this.deadline,
    isCompleted: isCompleted ?? this.isCompleted,
    createdAt: createdAt ?? this.createdAt,
  );
  PrayerGoal copyWithCompanion(PrayerGoalsCompanion data) {
    return PrayerGoal(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      targetCount: data.targetCount.present
          ? data.targetCount.value
          : this.targetCount,
      currentCount: data.currentCount.present
          ? data.currentCount.value
          : this.currentCount,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerGoal(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('targetCount: $targetCount, ')
          ..write('currentCount: $currentCount, ')
          ..write('deadline: $deadline, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    targetCount,
    currentCount,
    deadline,
    isCompleted,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerGoal &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.targetCount == this.targetCount &&
          other.currentCount == this.currentCount &&
          other.deadline == this.deadline &&
          other.isCompleted == this.isCompleted &&
          other.createdAt == this.createdAt);
}

class PrayerGoalsCompanion extends UpdateCompanion<PrayerGoal> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> targetCount;
  final Value<int> currentCount;
  final Value<DateTime?> deadline;
  final Value<bool> isCompleted;
  final Value<DateTime> createdAt;
  const PrayerGoalsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.targetCount = const Value.absent(),
    this.currentCount = const Value.absent(),
    this.deadline = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PrayerGoalsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required int targetCount,
    this.currentCount = const Value.absent(),
    this.deadline = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       targetCount = Value(targetCount);
  static Insertable<PrayerGoal> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? targetCount,
    Expression<int>? currentCount,
    Expression<DateTime>? deadline,
    Expression<bool>? isCompleted,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (targetCount != null) 'target_count': targetCount,
      if (currentCount != null) 'current_count': currentCount,
      if (deadline != null) 'deadline': deadline,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PrayerGoalsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<int>? targetCount,
    Value<int>? currentCount,
    Value<DateTime?>? deadline,
    Value<bool>? isCompleted,
    Value<DateTime>? createdAt,
  }) {
    return PrayerGoalsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      targetCount: targetCount ?? this.targetCount,
      currentCount: currentCount ?? this.currentCount,
      deadline: deadline ?? this.deadline,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (targetCount.present) {
      map['target_count'] = Variable<int>(targetCount.value);
    }
    if (currentCount.present) {
      map['current_count'] = Variable<int>(currentCount.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerGoalsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('targetCount: $targetCount, ')
          ..write('currentCount: $currentCount, ')
          ..write('deadline: $deadline, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PrayerTagsTable extends PrayerTags
    with TableInfo<$PrayerTagsTable, PrayerTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, color, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrayerTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerTag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PrayerTagsTable createAlias(String alias) {
    return $PrayerTagsTable(attachedDatabase, alias);
  }
}

class PrayerTag extends DataClass implements Insertable<PrayerTag> {
  final int id;
  final String name;
  final String? color;
  final DateTime createdAt;
  const PrayerTag({
    required this.id,
    required this.name,
    this.color,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PrayerTagsCompanion toCompanion(bool nullToAbsent) {
    return PrayerTagsCompanion(
      id: Value(id),
      name: Value(name),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      createdAt: Value(createdAt),
    );
  }

  factory PrayerTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerTag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PrayerTag copyWith({
    int? id,
    String? name,
    Value<String?> color = const Value.absent(),
    DateTime? createdAt,
  }) => PrayerTag(
    id: id ?? this.id,
    name: name ?? this.name,
    color: color.present ? color.value : this.color,
    createdAt: createdAt ?? this.createdAt,
  );
  PrayerTag copyWithCompanion(PrayerTagsCompanion data) {
    return PrayerTag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerTag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerTag &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.createdAt == this.createdAt);
}

class PrayerTagsCompanion extends UpdateCompanion<PrayerTag> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<DateTime> createdAt;
  const PrayerTagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PrayerTagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PrayerTag> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PrayerTagsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? color,
    Value<DateTime>? createdAt,
  }) {
    return PrayerTagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerTagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PrayerTagRelationsTable extends PrayerTagRelations
    with TableInfo<$PrayerTagRelationsTable, PrayerTagRelation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrayerTagRelationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _prayerIdMeta = const VerificationMeta(
    'prayerId',
  );
  @override
  late final GeneratedColumn<int> prayerId = GeneratedColumn<int>(
    'prayer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES prayers (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES prayer_tags (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [prayerId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prayer_tag_relations';
  @override
  VerificationContext validateIntegrity(
    Insertable<PrayerTagRelation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('prayer_id')) {
      context.handle(
        _prayerIdMeta,
        prayerId.isAcceptableOrUnknown(data['prayer_id']!, _prayerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_prayerIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {prayerId, tagId};
  @override
  PrayerTagRelation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrayerTagRelation(
      prayerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prayer_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $PrayerTagRelationsTable createAlias(String alias) {
    return $PrayerTagRelationsTable(attachedDatabase, alias);
  }
}

class PrayerTagRelation extends DataClass
    implements Insertable<PrayerTagRelation> {
  final int prayerId;
  final int tagId;
  const PrayerTagRelation({required this.prayerId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['prayer_id'] = Variable<int>(prayerId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  PrayerTagRelationsCompanion toCompanion(bool nullToAbsent) {
    return PrayerTagRelationsCompanion(
      prayerId: Value(prayerId),
      tagId: Value(tagId),
    );
  }

  factory PrayerTagRelation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrayerTagRelation(
      prayerId: serializer.fromJson<int>(json['prayerId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'prayerId': serializer.toJson<int>(prayerId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  PrayerTagRelation copyWith({int? prayerId, int? tagId}) => PrayerTagRelation(
    prayerId: prayerId ?? this.prayerId,
    tagId: tagId ?? this.tagId,
  );
  PrayerTagRelation copyWithCompanion(PrayerTagRelationsCompanion data) {
    return PrayerTagRelation(
      prayerId: data.prayerId.present ? data.prayerId.value : this.prayerId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrayerTagRelation(')
          ..write('prayerId: $prayerId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(prayerId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrayerTagRelation &&
          other.prayerId == this.prayerId &&
          other.tagId == this.tagId);
}

class PrayerTagRelationsCompanion extends UpdateCompanion<PrayerTagRelation> {
  final Value<int> prayerId;
  final Value<int> tagId;
  final Value<int> rowid;
  const PrayerTagRelationsCompanion({
    this.prayerId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrayerTagRelationsCompanion.insert({
    required int prayerId,
    required int tagId,
    this.rowid = const Value.absent(),
  }) : prayerId = Value(prayerId),
       tagId = Value(tagId);
  static Insertable<PrayerTagRelation> custom({
    Expression<int>? prayerId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (prayerId != null) 'prayer_id': prayerId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrayerTagRelationsCompanion copyWith({
    Value<int>? prayerId,
    Value<int>? tagId,
    Value<int>? rowid,
  }) {
    return PrayerTagRelationsCompanion(
      prayerId: prayerId ?? this.prayerId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (prayerId.present) {
      map['prayer_id'] = Variable<int>(prayerId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrayerTagRelationsCompanion(')
          ..write('prayerId: $prayerId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  late final $PrayersTable prayers = $PrayersTable(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $PrayerActivityTable prayerActivity = $PrayerActivityTable(this);
  late final $DashboardBlocksTable dashboardBlocks = $DashboardBlocksTable(
    this,
  );
  late final $PrayerRemindersTable prayerReminders = $PrayerRemindersTable(
    this,
  );
  late final $PrayerGoalsTable prayerGoals = $PrayerGoalsTable(this);
  late final $PrayerTagsTable prayerTags = $PrayerTagsTable(this);
  late final $PrayerTagRelationsTable prayerTagRelations =
      $PrayerTagRelationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    preferences,
    prayers,
    journalEntries,
    prayerActivity,
    dashboardBlocks,
    prayerReminders,
    prayerGoals,
    prayerTags,
    prayerTagRelations,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'prayers',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('prayer_tag_relations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'prayer_tags',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('prayer_tag_relations', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PreferencesTableCreateCompanionBuilder =
    PreferencesCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$PreferencesTableUpdateCompanionBuilder =
    PreferencesCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$PreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$PreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreferencesTable,
          Preference,
          $$PreferencesTableFilterComposer,
          $$PreferencesTableOrderingComposer,
          $$PreferencesTableAnnotationComposer,
          $$PreferencesTableCreateCompanionBuilder,
          $$PreferencesTableUpdateCompanionBuilder,
          (
            Preference,
            BaseReferences<_$AppDatabase, $PreferencesTable, Preference>,
          ),
          Preference,
          PrefetchHooks Function()
        > {
  $$PreferencesTableTableManager(_$AppDatabase db, $PreferencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferencesCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => PreferencesCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreferencesTable,
      Preference,
      $$PreferencesTableFilterComposer,
      $$PreferencesTableOrderingComposer,
      $$PreferencesTableAnnotationComposer,
      $$PreferencesTableCreateCompanionBuilder,
      $$PreferencesTableUpdateCompanionBuilder,
      (
        Preference,
        BaseReferences<_$AppDatabase, $PreferencesTable, Preference>,
      ),
      Preference,
      PrefetchHooks Function()
    >;
typedef $$PrayersTableCreateCompanionBuilder =
    PrayersCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> description,
      required String category,
      required String status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> answeredAt,
    });
typedef $$PrayersTableUpdateCompanionBuilder =
    PrayersCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<String> category,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> answeredAt,
    });

final class $$PrayersTableReferences
    extends BaseReferences<_$AppDatabase, $PrayersTable, Prayer> {
  $$PrayersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JournalEntriesTable, List<JournalEntry>>
  _journalEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.journalEntries,
    aliasName: $_aliasNameGenerator(
      db.prayers.id,
      db.journalEntries.relatedPrayerId,
    ),
  );

  $$JournalEntriesTableProcessedTableManager get journalEntriesRefs {
    final manager = $$JournalEntriesTableTableManager(
      $_db,
      $_db.journalEntries,
    ).filter((f) => f.relatedPrayerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_journalEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PrayerTagRelationsTable, List<PrayerTagRelation>>
  _prayerTagRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.prayerTagRelations,
        aliasName: $_aliasNameGenerator(
          db.prayers.id,
          db.prayerTagRelations.prayerId,
        ),
      );

  $$PrayerTagRelationsTableProcessedTableManager get prayerTagRelationsRefs {
    final manager = $$PrayerTagRelationsTableTableManager(
      $_db,
      $_db.prayerTagRelations,
    ).filter((f) => f.prayerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _prayerTagRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PrayersTableFilterComposer
    extends Composer<_$AppDatabase, $PrayersTable> {
  $$PrayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> journalEntriesRefs(
    Expression<bool> Function($$JournalEntriesTableFilterComposer f) f,
  ) {
    final $$JournalEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalEntries,
      getReferencedColumn: (t) => t.relatedPrayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalEntriesTableFilterComposer(
            $db: $db,
            $table: $db.journalEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> prayerTagRelationsRefs(
    Expression<bool> Function($$PrayerTagRelationsTableFilterComposer f) f,
  ) {
    final $$PrayerTagRelationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.prayerTagRelations,
      getReferencedColumn: (t) => t.prayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayerTagRelationsTableFilterComposer(
            $db: $db,
            $table: $db.prayerTagRelations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PrayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayersTable> {
  $$PrayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayersTable> {
  $$PrayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get answeredAt => $composableBuilder(
    column: $table.answeredAt,
    builder: (column) => column,
  );

  Expression<T> journalEntriesRefs<T extends Object>(
    Expression<T> Function($$JournalEntriesTableAnnotationComposer a) f,
  ) {
    final $$JournalEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.journalEntries,
      getReferencedColumn: (t) => t.relatedPrayerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.journalEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> prayerTagRelationsRefs<T extends Object>(
    Expression<T> Function($$PrayerTagRelationsTableAnnotationComposer a) f,
  ) {
    final $$PrayerTagRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.prayerTagRelations,
          getReferencedColumn: (t) => t.prayerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PrayerTagRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.prayerTagRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PrayersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayersTable,
          Prayer,
          $$PrayersTableFilterComposer,
          $$PrayersTableOrderingComposer,
          $$PrayersTableAnnotationComposer,
          $$PrayersTableCreateCompanionBuilder,
          $$PrayersTableUpdateCompanionBuilder,
          (Prayer, $$PrayersTableReferences),
          Prayer,
          PrefetchHooks Function({
            bool journalEntriesRefs,
            bool prayerTagRelationsRefs,
          })
        > {
  $$PrayersTableTableManager(_$AppDatabase db, $PrayersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> answeredAt = const Value.absent(),
              }) => PrayersCompanion(
                id: id,
                title: title,
                description: description,
                category: category,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                answeredAt: answeredAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                required String category,
                required String status,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> answeredAt = const Value.absent(),
              }) => PrayersCompanion.insert(
                id: id,
                title: title,
                description: description,
                category: category,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                answeredAt: answeredAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PrayersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({journalEntriesRefs = false, prayerTagRelationsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (journalEntriesRefs) db.journalEntries,
                    if (prayerTagRelationsRefs) db.prayerTagRelations,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (journalEntriesRefs)
                        await $_getPrefetchedData<
                          Prayer,
                          $PrayersTable,
                          JournalEntry
                        >(
                          currentTable: table,
                          referencedTable: $$PrayersTableReferences
                              ._journalEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PrayersTableReferences(
                                db,
                                table,
                                p0,
                              ).journalEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.relatedPrayerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (prayerTagRelationsRefs)
                        await $_getPrefetchedData<
                          Prayer,
                          $PrayersTable,
                          PrayerTagRelation
                        >(
                          currentTable: table,
                          referencedTable: $$PrayersTableReferences
                              ._prayerTagRelationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PrayersTableReferences(
                                db,
                                table,
                                p0,
                              ).prayerTagRelationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.prayerId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PrayersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayersTable,
      Prayer,
      $$PrayersTableFilterComposer,
      $$PrayersTableOrderingComposer,
      $$PrayersTableAnnotationComposer,
      $$PrayersTableCreateCompanionBuilder,
      $$PrayersTableUpdateCompanionBuilder,
      (Prayer, $$PrayersTableReferences),
      Prayer,
      PrefetchHooks Function({
        bool journalEntriesRefs,
        bool prayerTagRelationsRefs,
      })
    >;
typedef $$JournalEntriesTableCreateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<int> id,
      required String title,
      required String content,
      required String category,
      Value<String?> mood,
      Value<int?> relatedPrayerId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$JournalEntriesTableUpdateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> content,
      Value<String> category,
      Value<String?> mood,
      Value<int?> relatedPrayerId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$JournalEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntry> {
  $$JournalEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PrayersTable _relatedPrayerIdTable(_$AppDatabase db) =>
      db.prayers.createAlias(
        $_aliasNameGenerator(db.journalEntries.relatedPrayerId, db.prayers.id),
      );

  $$PrayersTableProcessedTableManager? get relatedPrayerId {
    final $_column = $_itemColumn<int>('related_prayer_id');
    if ($_column == null) return null;
    final manager = $$PrayersTableTableManager(
      $_db,
      $_db.prayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_relatedPrayerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PrayersTableFilterComposer get relatedPrayerId {
    final $$PrayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedPrayerId,
      referencedTable: $db.prayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayersTableFilterComposer(
            $db: $db,
            $table: $db.prayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PrayersTableOrderingComposer get relatedPrayerId {
    final $$PrayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedPrayerId,
      referencedTable: $db.prayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayersTableOrderingComposer(
            $db: $db,
            $table: $db.prayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PrayersTableAnnotationComposer get relatedPrayerId {
    final $$PrayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.relatedPrayerId,
      referencedTable: $db.prayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayersTableAnnotationComposer(
            $db: $db,
            $table: $db.prayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JournalEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalEntriesTable,
          JournalEntry,
          $$JournalEntriesTableFilterComposer,
          $$JournalEntriesTableOrderingComposer,
          $$JournalEntriesTableAnnotationComposer,
          $$JournalEntriesTableCreateCompanionBuilder,
          $$JournalEntriesTableUpdateCompanionBuilder,
          (JournalEntry, $$JournalEntriesTableReferences),
          JournalEntry,
          PrefetchHooks Function({bool relatedPrayerId})
        > {
  $$JournalEntriesTableTableManager(
    _$AppDatabase db,
    $JournalEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> mood = const Value.absent(),
                Value<int?> relatedPrayerId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => JournalEntriesCompanion(
                id: id,
                title: title,
                content: content,
                category: category,
                mood: mood,
                relatedPrayerId: relatedPrayerId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String content,
                required String category,
                Value<String?> mood = const Value.absent(),
                Value<int?> relatedPrayerId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => JournalEntriesCompanion.insert(
                id: id,
                title: title,
                content: content,
                category: category,
                mood: mood,
                relatedPrayerId: relatedPrayerId,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$JournalEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({relatedPrayerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (relatedPrayerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.relatedPrayerId,
                                referencedTable: $$JournalEntriesTableReferences
                                    ._relatedPrayerIdTable(db),
                                referencedColumn:
                                    $$JournalEntriesTableReferences
                                        ._relatedPrayerIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$JournalEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalEntriesTable,
      JournalEntry,
      $$JournalEntriesTableFilterComposer,
      $$JournalEntriesTableOrderingComposer,
      $$JournalEntriesTableAnnotationComposer,
      $$JournalEntriesTableCreateCompanionBuilder,
      $$JournalEntriesTableUpdateCompanionBuilder,
      (JournalEntry, $$JournalEntriesTableReferences),
      JournalEntry,
      PrefetchHooks Function({bool relatedPrayerId})
    >;
typedef $$PrayerActivityTableCreateCompanionBuilder =
    PrayerActivityCompanion Function({
      Value<int> id,
      required DateTime date,
      Value<bool> prayed,
    });
typedef $$PrayerActivityTableUpdateCompanionBuilder =
    PrayerActivityCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<bool> prayed,
    });

class $$PrayerActivityTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerActivityTable> {
  $$PrayerActivityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get prayed => $composableBuilder(
    column: $table.prayed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrayerActivityTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerActivityTable> {
  $$PrayerActivityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get prayed => $composableBuilder(
    column: $table.prayed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrayerActivityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerActivityTable> {
  $$PrayerActivityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get prayed =>
      $composableBuilder(column: $table.prayed, builder: (column) => column);
}

class $$PrayerActivityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerActivityTable,
          PrayerActivityData,
          $$PrayerActivityTableFilterComposer,
          $$PrayerActivityTableOrderingComposer,
          $$PrayerActivityTableAnnotationComposer,
          $$PrayerActivityTableCreateCompanionBuilder,
          $$PrayerActivityTableUpdateCompanionBuilder,
          (
            PrayerActivityData,
            BaseReferences<
              _$AppDatabase,
              $PrayerActivityTable,
              PrayerActivityData
            >,
          ),
          PrayerActivityData,
          PrefetchHooks Function()
        > {
  $$PrayerActivityTableTableManager(
    _$AppDatabase db,
    $PrayerActivityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerActivityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerActivityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerActivityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<bool> prayed = const Value.absent(),
              }) => PrayerActivityCompanion(id: id, date: date, prayed: prayed),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                Value<bool> prayed = const Value.absent(),
              }) => PrayerActivityCompanion.insert(
                id: id,
                date: date,
                prayed: prayed,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrayerActivityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerActivityTable,
      PrayerActivityData,
      $$PrayerActivityTableFilterComposer,
      $$PrayerActivityTableOrderingComposer,
      $$PrayerActivityTableAnnotationComposer,
      $$PrayerActivityTableCreateCompanionBuilder,
      $$PrayerActivityTableUpdateCompanionBuilder,
      (
        PrayerActivityData,
        BaseReferences<_$AppDatabase, $PrayerActivityTable, PrayerActivityData>,
      ),
      PrayerActivityData,
      PrefetchHooks Function()
    >;
typedef $$DashboardBlocksTableCreateCompanionBuilder =
    DashboardBlocksCompanion Function({
      Value<int> id,
      required String type,
      Value<int> position,
      Value<String?> settings,
    });
typedef $$DashboardBlocksTableUpdateCompanionBuilder =
    DashboardBlocksCompanion Function({
      Value<int> id,
      Value<String> type,
      Value<int> position,
      Value<String?> settings,
    });

class $$DashboardBlocksTableFilterComposer
    extends Composer<_$AppDatabase, $DashboardBlocksTable> {
  $$DashboardBlocksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settings => $composableBuilder(
    column: $table.settings,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DashboardBlocksTableOrderingComposer
    extends Composer<_$AppDatabase, $DashboardBlocksTable> {
  $$DashboardBlocksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settings => $composableBuilder(
    column: $table.settings,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DashboardBlocksTableAnnotationComposer
    extends Composer<_$AppDatabase, $DashboardBlocksTable> {
  $$DashboardBlocksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get settings =>
      $composableBuilder(column: $table.settings, builder: (column) => column);
}

class $$DashboardBlocksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DashboardBlocksTable,
          DashboardBlock,
          $$DashboardBlocksTableFilterComposer,
          $$DashboardBlocksTableOrderingComposer,
          $$DashboardBlocksTableAnnotationComposer,
          $$DashboardBlocksTableCreateCompanionBuilder,
          $$DashboardBlocksTableUpdateCompanionBuilder,
          (
            DashboardBlock,
            BaseReferences<
              _$AppDatabase,
              $DashboardBlocksTable,
              DashboardBlock
            >,
          ),
          DashboardBlock,
          PrefetchHooks Function()
        > {
  $$DashboardBlocksTableTableManager(
    _$AppDatabase db,
    $DashboardBlocksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DashboardBlocksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DashboardBlocksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DashboardBlocksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<String?> settings = const Value.absent(),
              }) => DashboardBlocksCompanion(
                id: id,
                type: type,
                position: position,
                settings: settings,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String type,
                Value<int> position = const Value.absent(),
                Value<String?> settings = const Value.absent(),
              }) => DashboardBlocksCompanion.insert(
                id: id,
                type: type,
                position: position,
                settings: settings,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DashboardBlocksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DashboardBlocksTable,
      DashboardBlock,
      $$DashboardBlocksTableFilterComposer,
      $$DashboardBlocksTableOrderingComposer,
      $$DashboardBlocksTableAnnotationComposer,
      $$DashboardBlocksTableCreateCompanionBuilder,
      $$DashboardBlocksTableUpdateCompanionBuilder,
      (
        DashboardBlock,
        BaseReferences<_$AppDatabase, $DashboardBlocksTable, DashboardBlock>,
      ),
      DashboardBlock,
      PrefetchHooks Function()
    >;
typedef $$PrayerRemindersTableCreateCompanionBuilder =
    PrayerRemindersCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> description,
      required DateTime scheduledTime,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$PrayerRemindersTableUpdateCompanionBuilder =
    PrayerRemindersCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<DateTime> scheduledTime,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

class $$PrayerRemindersTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerRemindersTable> {
  $$PrayerRemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrayerRemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerRemindersTable> {
  $$PrayerRemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrayerRemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerRemindersTable> {
  $$PrayerRemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PrayerRemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerRemindersTable,
          PrayerReminder,
          $$PrayerRemindersTableFilterComposer,
          $$PrayerRemindersTableOrderingComposer,
          $$PrayerRemindersTableAnnotationComposer,
          $$PrayerRemindersTableCreateCompanionBuilder,
          $$PrayerRemindersTableUpdateCompanionBuilder,
          (
            PrayerReminder,
            BaseReferences<
              _$AppDatabase,
              $PrayerRemindersTable,
              PrayerReminder
            >,
          ),
          PrayerReminder,
          PrefetchHooks Function()
        > {
  $$PrayerRemindersTableTableManager(
    _$AppDatabase db,
    $PrayerRemindersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerRemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerRemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerRemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> scheduledTime = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PrayerRemindersCompanion(
                id: id,
                title: title,
                description: description,
                scheduledTime: scheduledTime,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                required DateTime scheduledTime,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PrayerRemindersCompanion.insert(
                id: id,
                title: title,
                description: description,
                scheduledTime: scheduledTime,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrayerRemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerRemindersTable,
      PrayerReminder,
      $$PrayerRemindersTableFilterComposer,
      $$PrayerRemindersTableOrderingComposer,
      $$PrayerRemindersTableAnnotationComposer,
      $$PrayerRemindersTableCreateCompanionBuilder,
      $$PrayerRemindersTableUpdateCompanionBuilder,
      (
        PrayerReminder,
        BaseReferences<_$AppDatabase, $PrayerRemindersTable, PrayerReminder>,
      ),
      PrayerReminder,
      PrefetchHooks Function()
    >;
typedef $$PrayerGoalsTableCreateCompanionBuilder =
    PrayerGoalsCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> description,
      required int targetCount,
      Value<int> currentCount,
      Value<DateTime?> deadline,
      Value<bool> isCompleted,
      Value<DateTime> createdAt,
    });
typedef $$PrayerGoalsTableUpdateCompanionBuilder =
    PrayerGoalsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<int> targetCount,
      Value<int> currentCount,
      Value<DateTime?> deadline,
      Value<bool> isCompleted,
      Value<DateTime> createdAt,
    });

class $$PrayerGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerGoalsTable> {
  $$PrayerGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentCount => $composableBuilder(
    column: $table.currentCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PrayerGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerGoalsTable> {
  $$PrayerGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentCount => $composableBuilder(
    column: $table.currentCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrayerGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerGoalsTable> {
  $$PrayerGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentCount => $composableBuilder(
    column: $table.currentCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PrayerGoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerGoalsTable,
          PrayerGoal,
          $$PrayerGoalsTableFilterComposer,
          $$PrayerGoalsTableOrderingComposer,
          $$PrayerGoalsTableAnnotationComposer,
          $$PrayerGoalsTableCreateCompanionBuilder,
          $$PrayerGoalsTableUpdateCompanionBuilder,
          (
            PrayerGoal,
            BaseReferences<_$AppDatabase, $PrayerGoalsTable, PrayerGoal>,
          ),
          PrayerGoal,
          PrefetchHooks Function()
        > {
  $$PrayerGoalsTableTableManager(_$AppDatabase db, $PrayerGoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> targetCount = const Value.absent(),
                Value<int> currentCount = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PrayerGoalsCompanion(
                id: id,
                title: title,
                description: description,
                targetCount: targetCount,
                currentCount: currentCount,
                deadline: deadline,
                isCompleted: isCompleted,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                required int targetCount,
                Value<int> currentCount = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PrayerGoalsCompanion.insert(
                id: id,
                title: title,
                description: description,
                targetCount: targetCount,
                currentCount: currentCount,
                deadline: deadline,
                isCompleted: isCompleted,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PrayerGoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerGoalsTable,
      PrayerGoal,
      $$PrayerGoalsTableFilterComposer,
      $$PrayerGoalsTableOrderingComposer,
      $$PrayerGoalsTableAnnotationComposer,
      $$PrayerGoalsTableCreateCompanionBuilder,
      $$PrayerGoalsTableUpdateCompanionBuilder,
      (
        PrayerGoal,
        BaseReferences<_$AppDatabase, $PrayerGoalsTable, PrayerGoal>,
      ),
      PrayerGoal,
      PrefetchHooks Function()
    >;
typedef $$PrayerTagsTableCreateCompanionBuilder =
    PrayerTagsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> color,
      Value<DateTime> createdAt,
    });
typedef $$PrayerTagsTableUpdateCompanionBuilder =
    PrayerTagsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> color,
      Value<DateTime> createdAt,
    });

final class $$PrayerTagsTableReferences
    extends BaseReferences<_$AppDatabase, $PrayerTagsTable, PrayerTag> {
  $$PrayerTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PrayerTagRelationsTable, List<PrayerTagRelation>>
  _prayerTagRelationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.prayerTagRelations,
        aliasName: $_aliasNameGenerator(
          db.prayerTags.id,
          db.prayerTagRelations.tagId,
        ),
      );

  $$PrayerTagRelationsTableProcessedTableManager get prayerTagRelationsRefs {
    final manager = $$PrayerTagRelationsTableTableManager(
      $_db,
      $_db.prayerTagRelations,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _prayerTagRelationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PrayerTagsTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerTagsTable> {
  $$PrayerTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> prayerTagRelationsRefs(
    Expression<bool> Function($$PrayerTagRelationsTableFilterComposer f) f,
  ) {
    final $$PrayerTagRelationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.prayerTagRelations,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayerTagRelationsTableFilterComposer(
            $db: $db,
            $table: $db.prayerTagRelations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PrayerTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerTagsTable> {
  $$PrayerTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PrayerTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerTagsTable> {
  $$PrayerTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> prayerTagRelationsRefs<T extends Object>(
    Expression<T> Function($$PrayerTagRelationsTableAnnotationComposer a) f,
  ) {
    final $$PrayerTagRelationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.prayerTagRelations,
          getReferencedColumn: (t) => t.tagId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PrayerTagRelationsTableAnnotationComposer(
                $db: $db,
                $table: $db.prayerTagRelations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PrayerTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerTagsTable,
          PrayerTag,
          $$PrayerTagsTableFilterComposer,
          $$PrayerTagsTableOrderingComposer,
          $$PrayerTagsTableAnnotationComposer,
          $$PrayerTagsTableCreateCompanionBuilder,
          $$PrayerTagsTableUpdateCompanionBuilder,
          (PrayerTag, $$PrayerTagsTableReferences),
          PrayerTag,
          PrefetchHooks Function({bool prayerTagRelationsRefs})
        > {
  $$PrayerTagsTableTableManager(_$AppDatabase db, $PrayerTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PrayerTagsCompanion(
                id: id,
                name: name,
                color: color,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> color = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PrayerTagsCompanion.insert(
                id: id,
                name: name,
                color: color,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PrayerTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({prayerTagRelationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (prayerTagRelationsRefs) db.prayerTagRelations,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (prayerTagRelationsRefs)
                    await $_getPrefetchedData<
                      PrayerTag,
                      $PrayerTagsTable,
                      PrayerTagRelation
                    >(
                      currentTable: table,
                      referencedTable: $$PrayerTagsTableReferences
                          ._prayerTagRelationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PrayerTagsTableReferences(
                            db,
                            table,
                            p0,
                          ).prayerTagRelationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PrayerTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerTagsTable,
      PrayerTag,
      $$PrayerTagsTableFilterComposer,
      $$PrayerTagsTableOrderingComposer,
      $$PrayerTagsTableAnnotationComposer,
      $$PrayerTagsTableCreateCompanionBuilder,
      $$PrayerTagsTableUpdateCompanionBuilder,
      (PrayerTag, $$PrayerTagsTableReferences),
      PrayerTag,
      PrefetchHooks Function({bool prayerTagRelationsRefs})
    >;
typedef $$PrayerTagRelationsTableCreateCompanionBuilder =
    PrayerTagRelationsCompanion Function({
      required int prayerId,
      required int tagId,
      Value<int> rowid,
    });
typedef $$PrayerTagRelationsTableUpdateCompanionBuilder =
    PrayerTagRelationsCompanion Function({
      Value<int> prayerId,
      Value<int> tagId,
      Value<int> rowid,
    });

final class $$PrayerTagRelationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PrayerTagRelationsTable,
          PrayerTagRelation
        > {
  $$PrayerTagRelationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PrayersTable _prayerIdTable(_$AppDatabase db) =>
      db.prayers.createAlias(
        $_aliasNameGenerator(db.prayerTagRelations.prayerId, db.prayers.id),
      );

  $$PrayersTableProcessedTableManager get prayerId {
    final $_column = $_itemColumn<int>('prayer_id')!;

    final manager = $$PrayersTableTableManager(
      $_db,
      $_db.prayers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_prayerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PrayerTagsTable _tagIdTable(_$AppDatabase db) =>
      db.prayerTags.createAlias(
        $_aliasNameGenerator(db.prayerTagRelations.tagId, db.prayerTags.id),
      );

  $$PrayerTagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<int>('tag_id')!;

    final manager = $$PrayerTagsTableTableManager(
      $_db,
      $_db.prayerTags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PrayerTagRelationsTableFilterComposer
    extends Composer<_$AppDatabase, $PrayerTagRelationsTable> {
  $$PrayerTagRelationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PrayersTableFilterComposer get prayerId {
    final $$PrayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prayerId,
      referencedTable: $db.prayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayersTableFilterComposer(
            $db: $db,
            $table: $db.prayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PrayerTagsTableFilterComposer get tagId {
    final $$PrayerTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.prayerTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayerTagsTableFilterComposer(
            $db: $db,
            $table: $db.prayerTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrayerTagRelationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PrayerTagRelationsTable> {
  $$PrayerTagRelationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PrayersTableOrderingComposer get prayerId {
    final $$PrayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prayerId,
      referencedTable: $db.prayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayersTableOrderingComposer(
            $db: $db,
            $table: $db.prayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PrayerTagsTableOrderingComposer get tagId {
    final $$PrayerTagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.prayerTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayerTagsTableOrderingComposer(
            $db: $db,
            $table: $db.prayerTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrayerTagRelationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrayerTagRelationsTable> {
  $$PrayerTagRelationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PrayersTableAnnotationComposer get prayerId {
    final $$PrayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.prayerId,
      referencedTable: $db.prayers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayersTableAnnotationComposer(
            $db: $db,
            $table: $db.prayers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PrayerTagsTableAnnotationComposer get tagId {
    final $$PrayerTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.prayerTags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrayerTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.prayerTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrayerTagRelationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrayerTagRelationsTable,
          PrayerTagRelation,
          $$PrayerTagRelationsTableFilterComposer,
          $$PrayerTagRelationsTableOrderingComposer,
          $$PrayerTagRelationsTableAnnotationComposer,
          $$PrayerTagRelationsTableCreateCompanionBuilder,
          $$PrayerTagRelationsTableUpdateCompanionBuilder,
          (PrayerTagRelation, $$PrayerTagRelationsTableReferences),
          PrayerTagRelation,
          PrefetchHooks Function({bool prayerId, bool tagId})
        > {
  $$PrayerTagRelationsTableTableManager(
    _$AppDatabase db,
    $PrayerTagRelationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrayerTagRelationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrayerTagRelationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrayerTagRelationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> prayerId = const Value.absent(),
                Value<int> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PrayerTagRelationsCompanion(
                prayerId: prayerId,
                tagId: tagId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int prayerId,
                required int tagId,
                Value<int> rowid = const Value.absent(),
              }) => PrayerTagRelationsCompanion.insert(
                prayerId: prayerId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PrayerTagRelationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({prayerId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (prayerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.prayerId,
                                referencedTable:
                                    $$PrayerTagRelationsTableReferences
                                        ._prayerIdTable(db),
                                referencedColumn:
                                    $$PrayerTagRelationsTableReferences
                                        ._prayerIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable:
                                    $$PrayerTagRelationsTableReferences
                                        ._tagIdTable(db),
                                referencedColumn:
                                    $$PrayerTagRelationsTableReferences
                                        ._tagIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PrayerTagRelationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrayerTagRelationsTable,
      PrayerTagRelation,
      $$PrayerTagRelationsTableFilterComposer,
      $$PrayerTagRelationsTableOrderingComposer,
      $$PrayerTagRelationsTableAnnotationComposer,
      $$PrayerTagRelationsTableCreateCompanionBuilder,
      $$PrayerTagRelationsTableUpdateCompanionBuilder,
      (PrayerTagRelation, $$PrayerTagRelationsTableReferences),
      PrayerTagRelation,
      PrefetchHooks Function({bool prayerId, bool tagId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PreferencesTableTableManager get preferences =>
      $$PreferencesTableTableManager(_db, _db.preferences);
  $$PrayersTableTableManager get prayers =>
      $$PrayersTableTableManager(_db, _db.prayers);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$PrayerActivityTableTableManager get prayerActivity =>
      $$PrayerActivityTableTableManager(_db, _db.prayerActivity);
  $$DashboardBlocksTableTableManager get dashboardBlocks =>
      $$DashboardBlocksTableTableManager(_db, _db.dashboardBlocks);
  $$PrayerRemindersTableTableManager get prayerReminders =>
      $$PrayerRemindersTableTableManager(_db, _db.prayerReminders);
  $$PrayerGoalsTableTableManager get prayerGoals =>
      $$PrayerGoalsTableTableManager(_db, _db.prayerGoals);
  $$PrayerTagsTableTableManager get prayerTags =>
      $$PrayerTagsTableTableManager(_db, _db.prayerTags);
  $$PrayerTagRelationsTableTableManager get prayerTagRelations =>
      $$PrayerTagRelationsTableTableManager(_db, _db.prayerTagRelations);
}
