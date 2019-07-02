import 'package:flutter/material.dart';
import 'package:priorities/priorities/priorities_route.dart';
import 'package:priorities/priorities_comparsion/priority_comparsion_parent_widget.dart';
import 'package:priorities/start_test/main_route.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => PrioritiesRoute(), // should be WelcomeRoute()
          '/main_route': (context) => MainRoute(),
          '/priorities_route': (context) => PrioritiesRoute(),
          '/priorities_comparsion_parent_route': (context) => PriorityComparsionRootRoute(),
        });
  }
}
