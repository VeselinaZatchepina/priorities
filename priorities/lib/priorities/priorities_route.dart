import 'package:flutter/material.dart';

class PrioritiesRoute extends StatefulWidget {
  @override
  _PrioritiesRouteState createState() => _PrioritiesRouteState();
}

class _PrioritiesRouteState extends State<PrioritiesRoute> {
  int _countOfAddedPriorityFileds = 0;
  int _previousCountOfAddedPriorityFileds = 0;

  TextEditingController firstRootEditFieldController;
  TextEditingController secondRootEditFieldController;
  TextEditingController thirdRootEditFieldController;
  List<TextEditingController> _rootControllers;
  List<TextEditingController> _addedControllers = [];

  @override
  void initState() {
    firstRootEditFieldController = TextEditingController();
    secondRootEditFieldController = TextEditingController();
    thirdRootEditFieldController = TextEditingController();
    _rootControllers = [firstRootEditFieldController, secondRootEditFieldController, thirdRootEditFieldController];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(flex: 2, child: _defineTitle()),
          Expanded(
              flex: 8,
              child: ListView(
                children: <Widget>[
                  _definePriorityField("Family", _rootControllers[0]),
                  _definePriorityField("Job", _rootControllers[1]),
                  _definePriorityField("Money", _rootControllers[2]),
                  ..._defineAddedPriorityFiled(),
                  _defineAddPriorityButton(),
                  _defineStartButton()
                ],
              )),
        ],
      )),
    );
  }

  Widget _defineTitle() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text("Enter all main things in your life",
          style: TextStyle(fontSize: 18.0)),
    );
  }

  Widget _definePriorityField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 25.0,
        right: 25.0,
      ),
      child: TextFormField(
        decoration:
            InputDecoration(labelText: hint, border: OutlineInputBorder()),
        controller: controller,
      ),
    );
  }

  List<Widget> _defineAddedPriorityFiled() {
    if (_countOfAddedPriorityFileds == 0) {
      return [];
    }

    List<Widget> addedPriorityFields = [];
    for (var i = 0; i < _countOfAddedPriorityFileds; i++) {
      if (i == _countOfAddedPriorityFileds - 1 && _countOfAddedPriorityFileds != _previousCountOfAddedPriorityFileds) {
        TextEditingController newController = TextEditingController();
        _addedControllers.add(newController);
        addedPriorityFields.add(_definePriorityField("New priority$i", newController));
        _previousCountOfAddedPriorityFileds = _countOfAddedPriorityFileds;
        continue;
      }
      addedPriorityFields.add(_definePriorityField("New priority$i", _addedControllers[i]));
  }
    return addedPriorityFields;
  }

  Widget _defineAddPriorityButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 25.0,
        right: 25.0,
      ),
      child: Container(
        width: double.infinity,
        child: OutlineButton(
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            style: BorderStyle.solid,
            width: 1.0,
          ),
          onPressed: () {
            setState(() {
              _previousCountOfAddedPriorityFileds = _countOfAddedPriorityFileds;
              _countOfAddedPriorityFileds++;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(
              "Add priority".toUpperCase(),
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ),
      ),
    );
  }

  Widget _defineStartButton() {
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
            var priorities = [..._rootControllers, ..._addedControllers]
                .map((controller) => controller.text)
                .where((String priorityName) =>  priorityName != null && priorityName.isNotEmpty)
                .toSet()
                .toList();
            Navigator.pushNamed(context, "/priorities_comparsion_parent_route",
                arguments: priorities);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(
              "Start".toUpperCase(),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          color: Colors.orange.shade300,
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (int i=0; i < _addedControllers.length; i++) {
      _addedControllers[i].dispose();
    }
    _addedControllers.clear();
    super.dispose();
  }

}
