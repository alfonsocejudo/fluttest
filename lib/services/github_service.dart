/*
 * Created by Alfonso Cejudo, Monday, July 8th 2019.
 */

import 'package:chopper/chopper.dart';

part 'github_service.chopper.dart';

@ChopperApi(baseUrl: 'https://api.github.com')
abstract class GithubService extends ChopperService {
  static GithubService create([ChopperClient client]) =>
      _$GithubService(client);

  @Get(path: '/users/{login}')
  Future<Response> getUser(@Path('login') String login);
}
