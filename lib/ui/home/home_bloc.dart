/*
 * Created by Alfonso Cejudo, Tuesday, July 9th 2019.
 */

import 'dart:async';

import 'package:fluttest/db/github_db.dart';
import 'package:fluttest/repository/user_repository.dart';
import 'package:meta/meta.dart';

class HomeBloc {
  final UserRepository _userRepository;

  final _userController = StreamController<User>.broadcast();
  final _textFieldController = StreamController<String>.broadcast();

  // Outputs.
  Stream<User> get user => _userController.stream;
  Stream<String> get textField => _textFieldController.stream;

  // Inputs.
  Function(String) get changeTextField => _textFieldController.sink.add;
  Function(User) get setUser => _userController.sink.add;

  HomeBloc({@required userRepository}) : _userRepository = userRepository;

  void getCachedUser() async {
    try {
      User user = await _userRepository.loadMostRecentUser();

      setUser(user);
    } catch (e) {
      print('Caught $e');
    }
  }

  void submitUserLogin(String login) async {
    try {
      User user = await _userRepository.refreshUser(login);

      setUser(user);
    } catch (e) {
      print('Caught $e');
    }
  }

  dispose() {
    _userController.close();
    _textFieldController.close();
  }
}
