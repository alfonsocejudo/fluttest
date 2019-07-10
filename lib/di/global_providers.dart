/*
 * Created by Alfonso Cejudo, Tuesday, July 9th 2019.
 */

import 'package:fluttest/db/github_db.dart';
import 'package:fluttest/db/user_dao.dart';
import 'package:fluttest/repository/github_client.dart';
import 'package:fluttest/repository/user_repository.dart';
import 'package:fluttest/services/github_service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> globalProviders = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: GithubDb()),
  Provider.value(value: GithubClient()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<GithubDb, UserDao>(
      builder: (context, githubDb, userDao) => UserDao(githubDb)),
  ProxyProvider<GithubClient, GithubService>(
      builder: (context, githubClient, githubService) =>
          GithubService.create(githubClient.chopperClient),
      dispose: (context, githubService) => githubService.client.dispose()),
  ProxyProvider2<UserDao, GithubService, UserRepository>(
      builder: (context, userDao, githubService, userRepository) =>
          UserRepository(userDao: userDao, githubService: githubService))
];
