// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$GithubService extends GithubService {
  _$GithubService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = GithubService;

  Future<Response> getUser(String login) {
    final $url = 'https://api.github.com/users/${login}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
