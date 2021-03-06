import 'package:flutter/material.dart';
import 'package:priorities/entities/latest_test_result.dart';
import 'package:priorities/test_result/test_result_bloc.dart';

class TestResultRoute extends StatelessWidget {
  final List resultPriorities;

  TestResultRoute(this.resultPriorities);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: ListView(
          children: <Widget>[
            _definePriorityButton(resultPriorities[0]),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: _definePriorityButton(resultPriorities[1]),
            ),
            _definePriorityButton(resultPriorities[2]),
            _defineOkButton(context)
          ],
        ));
  }

  Widget _definePriorityButton(String priorityName) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25.0,
      ),
      child: Container(
        width: double.infinity,
        child: OutlineButton(
          borderSide: BorderSide(
            color: Colors.lightBlue,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(priorityName.toUpperCase()),
          ),
        ),
      ),
    );
  }

  Widget _defineOkButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
        left: 50.0,
        right: 50.0,
      ),
      child: Container(
        width: double.infinity,
        child: FlatButton(
          onPressed: () {
            TestResultBloc().saveTestResult(TestResult(
                DateTime.now().millisecondsSinceEpoch,
                resultPriorities[0],
                resultPriorities[1],
                resultPriorities[2]));
            Navigator.pushNamed(context, "/main_route");
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(
              "OK".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
