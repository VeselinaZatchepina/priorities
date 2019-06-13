import 'package:flutter/material.dart';

class PrioritiesRoute extends StatefulWidget {
  @override
  _PrioritiesRouteState createState() => _PrioritiesRouteState();
}

class _PrioritiesRouteState extends State<PrioritiesRoute> {

  int _countOfAddedPriorityFileds = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: <Widget>[
          Expanded(flex: 2, child: _defineTitle()),
          Expanded(flex: 8, child: ListView(
            children: <Widget>[
              _definePriorityField("Family"),
              _definePriorityField("Job"),
              _definePriorityField("Money"),
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
      child: Text("Enter all main things in your life", style: TextStyle(
          fontSize: 18.0
      )),
    );
  }

  Widget _definePriorityField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 25.0, right: 25.0,),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder()),
        controller: null,
      ),
    );
  }

  List<Widget> _defineAddedPriorityFiled() {
    List<Widget> addedPriorityFields = [];
    for (var i = 0; i < _countOfAddedPriorityFileds; i++) {
      addedPriorityFields.add(_definePriorityField("New priority"));
    }
    return addedPriorityFields;
  }

  Widget _defineAddPriorityButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 25.0, right: 25.0,),
      child: Container(
        width: double.infinity,
        child: OutlineButton(
          borderSide: BorderSide(
            color: Colors.grey.shade600, //Color of the border
            style: BorderStyle.solid, //Style of the border
            width: 1.0, //width of the border
          ),
          onPressed: () {
            setState(() {
              _countOfAddedPriorityFileds++;
            });
          },
          child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text("Add priority".toUpperCase(), style: TextStyle(
                  color: Colors.grey
                      .shade600),) //Icon(Icons.add, color: Colors.grey.shade300,),
          ),
        ),
      ),
    );
  }

  Widget _defineStartButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 50.0, right: 50.0,),
      child: Container(
        width: double.infinity,
        child: FlatButton(onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(
              "Start".toUpperCase(), style: TextStyle(color: Colors.black87),),
          ),
          color: Colors.orange.shade300,),
      ),
    );
  }

}

