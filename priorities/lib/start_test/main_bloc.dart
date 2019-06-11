import 'dart:async';
import 'dart:io';

import 'package:priorities/entities/latest_test_result.dart';
import 'package:priorities/state/state.dart';

class MainBloc {

  final _latestResultsStreamController = StreamController<LatestResultState>();

  Stream<LatestResultState> get latestResultsStream => _latestResultsStreamController.stream;

  void getLatestTestResults() {
    _latestResultsStreamController.sink.add(LatestResultState.loading());
    sleep(const Duration(seconds: 5));
    _latestResultsStreamController.sink.add(LatestResultState.success([
      TestResult("04.06.2019", "Family", "Job", "Money"),
      TestResult("04.06.2019", "Family", "Job", "Money"),
      TestResult("04.06.2019", "Family", "Job", "Money"),
      TestResult("04.06.2019", "Family", "Job", "Money"),
      TestResult("04.06.2019", "Family", "Job", "Money")
    ]));
  }

  void dispose() {
    _latestResultsStreamController.close();
  }

}