/*
 * Created by Alfonso Cejudo, Monday, July 8th 2019.
 */

import 'package:flutter/material.dart';
import 'package:fluttest/components/router.dart';
import 'package:fluttest/ui/home/home.dart';
import 'package:provider/provider.dart';

import 'di/global_providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: globalProviders,
      child: MaterialApp(
        title: 'Fluttest',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.orange,
          textTheme: TextTheme(button: TextStyle(color: Colors.white)),
        ),
        onGenerateRoute: Router.generateRoute,
        initialRoute: Home.route,
      ),
    );
  }
}
