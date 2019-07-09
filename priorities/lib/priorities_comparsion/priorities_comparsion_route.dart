import 'package:flutter/material.dart';
import 'package:priorities/entities/priority.dart';

class PrioritiesComparsionRoute extends StatelessWidget {
  final Function _priorityClickedCallback;
  final String firstPriority;
  final String secondPriority;

  PrioritiesComparsionRoute(
      this._priorityClickedCallback, this.firstPriority, this.secondPriority);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: ListView(
          children: <Widget>[
            _definePriorityButton(firstPriority),
            Container(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Text(
                    "VS",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                )),
            _definePriorityButton(secondPriority)
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
          onPressed: () {
            _priorityClickedCallback(Priority(priorityName));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(priorityName.toUpperCase()),
          ),
        ),
      ),
    );
  }
}
