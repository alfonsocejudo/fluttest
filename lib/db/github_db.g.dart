// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class User extends DataClass implements Insertable<User> {
  final int id;
  final String login;
  final int userId;
  final String avatarUrl;
  final String name;
  final String reposUrl;
  User(
      {@required this.id,
      @required this.login,
      @required this.userId,
      @required this.avatarUrl,
      @required this.name,
      @required this.reposUrl});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      login:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}login']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      avatarUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar_url']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      reposUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}repos_url']),
    );
  }
  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return User(
      id: serializer.fromJson<int>(json['id']),
      login: serializer.fromJson<String>(json['login']),
      userId: serializer.fromJson<int>(json['userId']),
      avatarUrl: serializer.fromJson<String>(json['avatarUrl']),
      name: serializer.fromJson<String>(json['name']),
      reposUrl: serializer.fromJson<String>(json['reposUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'login': serializer.toJson<String>(login),
      'userId': serializer.toJson<int>(userId),
      'avatarUrl': serializer.toJson<String>(avatarUrl),
      'name': serializer.toJson<String>(name),
      'reposUrl': serializer.toJson<String>(reposUrl),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<User>>(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      login:
          login == null && nullToAbsent ? const Value.absent() : Value(login),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      reposUrl: reposUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(reposUrl),
    ) as T;
  }

  User copyWith(
          {int id,
          String login,
          int userId,
          String avatarUrl,
          String name,
          String reposUrl}) =>
      User(
        id: id ?? this.id,
        login: login ?? this.login,
        userId: userId ?? this.userId,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        name: name ?? this.name,
        reposUrl: reposUrl ?? this.reposUrl,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('login: $login, ')
          ..write('userId: $userId, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('name: $name, ')
          ..write('reposUrl: $reposUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      $mrjc(
          $mrjc(
              $mrjc($mrjc($mrjc(0, id.hashCode), login.hashCode),
                  userId.hashCode),
              avatarUrl.hashCode),
          name.hashCode),
      reposUrl.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is User &&
          other.id == id &&
          other.login == login &&
          other.userId == userId &&
          other.avatarUrl == avatarUrl &&
          other.name == name &&
          other.reposUrl == reposUrl);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> login;
  final Value<int> userId;
  final Value<String> avatarUrl;
  final Value<String> name;
  final Value<String> reposUrl;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.login = const Value.absent(),
    this.userId = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.name = const Value.absent(),
    this.reposUrl = const Value.absent(),
  });
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false, hasAutoIncrement: true);
  }

  final VerificationMeta _loginMeta = const VerificationMeta('login');
  GeneratedTextColumn _login;
  @override
  GeneratedTextColumn get login => _login ??= _constructLogin();
  GeneratedTextColumn _constructLogin() {
    return GeneratedTextColumn(
      'login',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _avatarUrlMeta = const VerificationMeta('avatarUrl');
  GeneratedTextColumn _avatarUrl;
  @override
  GeneratedTextColumn get avatarUrl => _avatarUrl ??= _constructAvatarUrl();
  GeneratedTextColumn _constructAvatarUrl() {
    return GeneratedTextColumn(
      'avatar_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _reposUrlMeta = const VerificationMeta('reposUrl');
  GeneratedTextColumn _reposUrl;
  @override
  GeneratedTextColumn get reposUrl => _reposUrl ??= _constructReposUrl();
  GeneratedTextColumn _constructReposUrl() {
    return GeneratedTextColumn(
      'repos_url',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, login, userId, avatarUrl, name, reposUrl];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.login.present) {
      context.handle(
          _loginMeta, login.isAcceptableValue(d.login.value, _loginMeta));
    } else if (login.isRequired && isInserting) {
      context.missing(_loginMeta);
    }
    if (d.userId.present) {
      context.handle(
          _userIdMeta, userId.isAcceptableValue(d.userId.value, _userIdMeta));
    } else if (userId.isRequired && isInserting) {
      context.missing(_userIdMeta);
    }
    if (d.avatarUrl.present) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableValue(d.avatarUrl.value, _avatarUrlMeta));
    } else if (avatarUrl.isRequired && isInserting) {
      context.missing(_avatarUrlMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.reposUrl.present) {
      context.handle(_reposUrlMeta,
          reposUrl.isAcceptableValue(d.reposUrl.value, _reposUrlMeta));
    } else if (reposUrl.isRequired && isInserting) {
      context.missing(_reposUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.login.present) {
      map['login'] = Variable<String, StringType>(d.login.value);
    }
    if (d.userId.present) {
      map['user_id'] = Variable<int, IntType>(d.userId.value);
    }
    if (d.avatarUrl.present) {
      map['avatar_url'] = Variable<String, StringType>(d.avatarUrl.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.reposUrl.present) {
      map['repos_url'] = Variable<String, StringType>(d.reposUrl.value);
    }
    return map;
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$GithubDb extends GeneratedDatabase {
  _$GithubDb(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as GithubDb);
  @override
  List<TableInfo> get allTables => [users];
}
