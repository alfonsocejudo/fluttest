/*
 * Created by Alfonso Cejudo, Monday, July 8th 2019.
 */

import 'package:fluttest/db/github_db.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'user_dao.g.dart';

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<GithubDb> with _$UserDaoMixin {
  UserDao(GithubDb db) : super(db);

  Future<List<User>> getUsers() => select(users).get();

  Future<List<User>> getLogin(String login) =>
      (select(users)..where((user) => user.login.equals(login))).get();

  Future insertOrReplaceUser(User user) =>
      into(users).insert(user, orReplace: true);
}
