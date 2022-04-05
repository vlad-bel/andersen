// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DBUserData extends DataClass implements Insertable<DBUserData> {
  final int id;
  final String email;
  final String password;
  final DateTime registerTime;
  DBUserData(
      {required this.id,
      required this.email,
      required this.password,
      required this.registerTime});
  factory DBUserData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBUserData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      registerTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}register_time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['register_time'] = Variable<DateTime>(registerTime);
    return map;
  }

  DBUserCompanion toCompanion(bool nullToAbsent) {
    return DBUserCompanion(
      id: Value(id),
      email: Value(email),
      password: Value(password),
      registerTime: Value(registerTime),
    );
  }

  factory DBUserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DBUserData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      registerTime: serializer.fromJson<DateTime>(json['registerTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'registerTime': serializer.toJson<DateTime>(registerTime),
    };
  }

  DBUserData copyWith(
          {int? id, String? email, String? password, DateTime? registerTime}) =>
      DBUserData(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        registerTime: registerTime ?? this.registerTime,
      );
  @override
  String toString() {
    return (StringBuffer('DBUserData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('registerTime: $registerTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, password, registerTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBUserData &&
          other.id == this.id &&
          other.email == this.email &&
          other.password == this.password &&
          other.registerTime == this.registerTime);
}

class DBUserCompanion extends UpdateCompanion<DBUserData> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> password;
  final Value<DateTime> registerTime;
  const DBUserCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.registerTime = const Value.absent(),
  });
  DBUserCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String password,
    required DateTime registerTime,
  })  : email = Value(email),
        password = Value(password),
        registerTime = Value(registerTime);
  static Insertable<DBUserData> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? password,
    Expression<DateTime>? registerTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (registerTime != null) 'register_time': registerTime,
    });
  }

  DBUserCompanion copyWith(
      {Value<int>? id,
      Value<String>? email,
      Value<String>? password,
      Value<DateTime>? registerTime}) {
    return DBUserCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      registerTime: registerTime ?? this.registerTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (registerTime.present) {
      map['register_time'] = Variable<DateTime>(registerTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBUserCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('registerTime: $registerTime')
          ..write(')'))
        .toString();
  }
}

class $DBUserTable extends DBUser with TableInfo<$DBUserTable, DBUserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DBUserTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _registerTimeMeta =
      const VerificationMeta('registerTime');
  @override
  late final GeneratedColumn<DateTime?> registerTime =
      GeneratedColumn<DateTime?>('register_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, email, password, registerTime];
  @override
  String get aliasedName => _alias ?? 'd_b_user';
  @override
  String get actualTableName => 'd_b_user';
  @override
  VerificationContext validateIntegrity(Insertable<DBUserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('register_time')) {
      context.handle(
          _registerTimeMeta,
          registerTime.isAcceptableOrUnknown(
              data['register_time']!, _registerTimeMeta));
    } else if (isInserting) {
      context.missing(_registerTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBUserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBUserData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DBUserTable createAlias(String alias) {
    return $DBUserTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DBUserTable dBUser = $DBUserTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dBUser];
}
