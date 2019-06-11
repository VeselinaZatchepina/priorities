import 'package:flutter/material.dart';

class WelcomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Column(
        children: <Widget>[
          _defineCloseWelcomeRouteBtn(context),
          _defineWelcomeText()
        ],
      ),
    )));
  }

  Widget _defineCloseWelcomeRouteBtn(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      child: RawMaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/main_route');
        },
        child: Icon(Icons.clear),
        shape: CircleBorder(side: BorderSide(color: Colors.black)),
      ),
    );
  }

  Widget _defineWelcomeText() {
    return Expanded(
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0, left: 20, right: 20),
          child: Text(
            "This application will help you to define your life priorities.\nJust press \"Play\" button!",
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
