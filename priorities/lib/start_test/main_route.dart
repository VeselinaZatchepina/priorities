import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:priorities/entities/latest_test_result.dart';
import 'package:priorities/start_test/main_bloc.dart';
import 'package:priorities/state/state.dart';

class MainRoute extends StatefulWidget {
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> with TickerProviderStateMixin {
  MainBloc _mainBloc;
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(flex: 3, child: _defineStartButton()),
            Expanded(flex: 6, child: _defineLatestResultsList())
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _mainBloc = MainBloc();
    _mainBloc.getLatestTestResults();

    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 50, end: 80).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value == 80) {
            controller.reverse();
          }

          if (animation.value == 50) {
            controller.forward();
          }
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();

    super.initState();
  }

  Widget _defineStartButton() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            side: BorderSide(
              color: Colors.grey,
            )),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: animation.value,
              width: animation.value,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/priorities_route");
                },
                child: Icon(
                  Icons.play_arrow,
                  size: animation.value / 2,
                ),
                backgroundColor: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _defineLatestResultsList() {
    return StreamBuilder<LatestResultState>(
      stream: _mainBloc.latestResultsStream,
      initialData: LatestResultState.init(),
      builder: (context, snapshot) {
        if (snapshot.data is LatestResultInit) {
          return Container();
        }

        if (snapshot.data is LatestResultLoading) {
          return _buildLoading();
        }

        if (snapshot.data is LatestResultError) {
          return _buildError();
        }

        if (snapshot.data is LatestResultSuccess) {
          LatestResultSuccess latestResults = snapshot.data;
          if (latestResults.testResults.isNotEmpty) {
            return _buildDescriptionArea(latestResults.testResults);
          } else {
            return _buildError();
          }
        }
      },
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return Center(
      child: Text('Ooops...list is empty'),
    );
  }

  Widget _buildDescriptionArea(List<TestResult> latestResults) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 0.0),
      child: Container(
        child: Center(
          child: ListView.builder(
              itemCount: latestResults.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildListViewItem(latestResults[index]);
              }),
        ),
      ),
    );
  }

  Widget _buildListViewItem(TestResult latestResult) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            side: BorderSide(
              color: Colors.grey,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    _defineDate(latestResult.date),
                    style: TextStyle(fontSize: 10),
                  )),
              _createBorderedText(latestResult.firstLevelPriority),
              _createBorderedText(latestResult.secondLevelPriority),
              _createBorderedText(latestResult.thirdLevelPriority),
            ],
          ),
        ),
      ),
    );
  }

  String _defineDate(int millisecondsSinceEpoch) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    var format = DateFormat.yMMMd();
    return format.format(dateTime);
  }

  Widget _createBorderedText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(
            alignment: AlignmentDirectional.center,
            decoration: _circleBorderDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                text.toUpperCase(),
                style: TextStyle(),
              ),
            )),
      ),
    );
  }

  BoxDecoration _circleBorderDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1.0, color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }

  @override
  void dispose() {
    _mainBloc.dispose();
    controller.dispose();
    super.dispose();
  }
}
