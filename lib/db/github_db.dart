/*
 * Created by Alfonso Cejudo, Monday, July 8th 2019.
 */

import 'package:fluttest/db/user_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'github_db.g.dart';

// Moor will automatically generate a class called User, a row of this table.
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get login => text()();

  IntColumn get userId => integer()();

  TextColumn get avatarUrl => text()();

  TextColumn get name => text()();

  TextColumn get reposUrl => text()();
}

@UseMoor(tables: [Users], daos: [UserDao])
class GithubDb extends _$GithubDb {
  GithubDb() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;
}
