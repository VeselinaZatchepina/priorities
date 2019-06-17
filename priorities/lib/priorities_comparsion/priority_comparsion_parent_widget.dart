import 'package:flutter/material.dart';
import 'package:priorities/priorities_comparsion/priorities_comparsion_route.dart';
import 'package:priorities/state/priority.dart';

class PriorityComparsionParentRoute extends StatefulWidget {
  @override
  _PriorityComparsionParentRouteState createState() =>
      _PriorityComparsionParentRouteState();
}

class _PriorityComparsionParentRouteState
    extends State<PriorityComparsionParentRoute> {

  double _currentProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(flex: 2, child: _defineHeader()),
          PrioritiesComparsionRoute(priorityClickedCallback),
        ],
      )),
    );
  }

  Widget _defineHeader() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          ProgressStatus(_currentProgress),
          _defineTitle(),
        ],
      ),
    );
  }

  Expanded _defineTitle() {
    return Expanded(
        child: Container(
            alignment: AlignmentDirectional.center,
            child: Text("Choose priority", style: TextStyle(fontSize: 18.0))));
  }

  void priorityClickedCallback(Priority priority) {
    setState(() {
      _currentProgress += 0.1;
    });
  }

}

class ProgressStatus extends StatelessWidget {

  final double _currentProgress;

  ProgressStatus(this._currentProgress);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _currentProgress ?? 0.0,
      backgroundColor: Colors.grey.shade800,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
    );
  }
}

