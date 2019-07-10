/*
 * Created by Alfonso Cejudo, Monday, July 8th 2019.
 */

import 'package:chopper/chopper.dart';
import 'package:fluttest/db/github_db.dart';
import 'package:fluttest/db/user_dao.dart';
import 'package:fluttest/services/github_service.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final UserDao _userDao;
  final GithubService _githubService;

  UserRepository({@required userDao, @required githubService})
      : _userDao = userDao,
        _githubService = githubService;

  // Load up last saved user, if one exists.
  Future<User> loadMostRecentUser() async {
    List users = await _userDao.getUsers();
    if ((users != null) && users.isNotEmpty) {
      return users.last;
    }

    return null;
  }

  Future<User> refreshUser(String login) async {
    // Retrieve latest user information from API.
    Response response;

    try {
      response = await _githubService.getUser(login);
    } catch (e) {
      print('Caught ${e.body}');
      rethrow;
    }

    // Save response to Users db.
    Map responseBody = response.body;

    String responseLogin = responseBody['login'];
    int userId = responseBody['id'];
    String avatarUrl = responseBody['avatar_url'];
    String name = responseBody['name'];
    String reposUrl = responseBody['repos_url'];

    await _userDao.insertOrReplaceUser(User(
        login: responseLogin,
        userId: userId,
        avatarUrl: avatarUrl,
        name: name,
        reposUrl: reposUrl));

    // Return saved User row.
    return _userDao.getLogin(login).then((list) {
      if ((list != null) && list.isNotEmpty) {
        return list.last;
      }

      return null;
    });
  }
}
