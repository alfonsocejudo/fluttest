/*
 * Created by Alfonso Cejudo, Tuesday, July 9th 2019.
 */

import 'package:chopper/chopper.dart';
import 'package:fluttest/services/github_service.dart';
import 'package:logging/logging.dart';

class GithubClient {
  final ChopperClient chopperClient;

  GithubClient()
      : chopperClient = ChopperClient(
            baseUrl: 'https://api.github.com',
            services: [GithubService.create()],
            interceptors: [HttpLoggingInterceptor()],
            converter: JsonConverter()) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    });
  }
}
