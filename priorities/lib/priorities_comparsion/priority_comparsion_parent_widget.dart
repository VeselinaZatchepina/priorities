import 'package:flutter/material.dart';
import 'package:priorities/priorities_comparsion/priorities_comparsion_route.dart';
import 'package:priorities/entities/priority.dart';
import 'package:priorities/test_result/test_result_route.dart';


class PriorityComparsionRootRoute extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final List<String> priorities = ModalRoute
        .of(context)
        .settings
        .arguments;
    return PriorityComparsionParentRoute(_initPrioritiesMap(priorities));
  }

  Map<String, int> _initPrioritiesMap(List<String> priorities) {
    var prioritiesMap = Map<String, int>();
    for (String priority in priorities) {
      prioritiesMap[priority] = 0;
    }
    for (MapEntry<String, int> value  in prioritiesMap.entries) {
      print(value.key + " " + value.value.toString());
    }
    return prioritiesMap;
  }
  
}


class PriorityComparsionParentRoute extends StatefulWidget {

  final Map<String, int> _prioritiesMap;

  PriorityComparsionParentRoute(this._prioritiesMap);

  @override
  _PriorityComparsionParentRouteState createState() =>
      _PriorityComparsionParentRouteState();
}

class _PriorityComparsionParentRouteState
    extends State<PriorityComparsionParentRoute> {
  
  double _currentProgress = 0.0;
  double _progressStep = 0.0;

  int firstPriorityIndex = 0;
  int secondPriorityIndex = 1;

  bool isPriorityTestResultShowed = false;

  @override
  Widget build(BuildContext context) {
    
    _progressStep = _getProgressStep();

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(flex: 2, child: _defineHeader()),
              _getContent(),
            ],
          )),
    );
  }

  Widget _getContent() {
    if (isPriorityTestResultShowed) {
      return _getPriorityTestResult();
    } else {
      return _getPrioritiesComparsionRoute();
    }
  }

  List _getResultPriorities() {
    var priorities = widget._prioritiesMap.values.toList();
    priorities.sort();
    priorities.reversed;
    return [
      _getPriorityByIndex(priorities[0]),
      _getPriorityByIndex(priorities[1]),
      _getPriorityByIndex(priorities[2]),
    ];
  }

  Widget _getPrioritiesComparsionRoute() {
    return PrioritiesComparsionRoute(priorityClickedCallback,
        widget._prioritiesMap.keys.elementAt(firstPriorityIndex),
        widget._prioritiesMap.keys.elementAt(secondPriorityIndex));
  }

  Widget _getPriorityTestResult() {
    return TestResultRoute(_getResultPriorities());
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
            child: Text(_getTextTitle(), style: TextStyle(fontSize: 18.0))));
  }
  
  String _getTextTitle() {
    if (isPriorityTestResultShowed) {
      return "Your priorities are:";
    } else {
      return "Choose priority";
    }
  }

  void priorityClickedCallback(Priority priority) {
    _definePriorityIndexes();

    widget._prioritiesMap[priority.priorityName] += 1;

    setState(() {
      _currentProgress += _progressStep;
    });
  }

  void _definePriorityIndexes() {
    if (secondPriorityIndex == widget._prioritiesMap.length - 1) {
      if (firstPriorityIndex < widget._prioritiesMap.length - 2) {
        firstPriorityIndex++;
        secondPriorityIndex = firstPriorityIndex + 1;
      } else {
        setState(() {
          isPriorityTestResultShowed = true;
        });
      }
    } else {
      secondPriorityIndex++;
    }
  }

  String _getPriorityByIndex(int value) =>
      widget._prioritiesMap.keys.toList()[widget._prioritiesMap.values.toList().indexOf(
          value)];

  int _getFullComparsionProgress() {
    int progress = 0;
    int counter = 1;
    int diffCounter = 1;

    if (widget._prioritiesMap.length == 2) {
      return 1;
    }

    while (diffCounter > 0) {
      diffCounter = widget._prioritiesMap.length - counter;
      progress = diffCounter + progress;
      counter++;
    }
    return progress;
  }

  double _getProgressStep() => 1 / _getFullComparsionProgress();

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

