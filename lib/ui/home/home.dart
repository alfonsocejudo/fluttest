/*
 * Created by Alfonso Cejudo, Tuesday, July 9th 2019.
 */

import 'package:flutter/material.dart';
import 'package:fluttest/db/github_db.dart';
import 'package:fluttest/ui/home/home_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quiver/strings.dart';

class Home extends StatefulWidget {
  static const String route = '/';

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc _homeBloc;

  @override
  void didChangeDependencies() {
    _homeBloc = Provider.of<HomeBloc>(context);
    _homeBloc.getCachedUser();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fluttest',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder(
                    stream: _homeBloc.user,
                    builder: (_, AsyncSnapshot<User> snapshot) {
                      if (snapshot.data == null) {
                        return Container();
                      } else {
                        var user = snapshot.data;

                        return Text(
                            'Github\'s ${user.login} is actually:\n${user.name}');
                      }
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    onChanged: _homeBloc.changeTextField,
                  ),
                  StreamBuilder(
                    stream: _homeBloc.textField,
                    builder: (_, AsyncSnapshot<String> snapshot) {
                      return RaisedButton(
                        child: Text(
                          'Submit',
                          style: Theme.of(context).textTheme.button,
                        ),
                        disabledColor: Colors.grey,
                        color: Theme.of(context).primaryColor,
                        onPressed: isEmpty(snapshot.data)
                            ? null
                            : () {
                                _homeBloc.submitUserLogin(snapshot.data);
                              },
                      );
                    },
                  ),
                ],
              )),
        ));
  }
}
