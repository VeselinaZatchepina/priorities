import 'package:flutter/material.dart';
import 'package:priorities/start_test/main_route.dart';
import 'package:priorities/welcome/welcome_route.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MainRoute(),
          '/main_route': (context) => MainRoute(),
        });
  }
}
