import 'dart:async';
import 'package:priorities/domain/priorities_use_case_impl.dart';
import 'package:priorities/state/state.dart';

class MainBloc {
  final _latestResultsStreamController = StreamController<LatestResultState>();

  Stream<LatestResultState> get latestResultsStream =>
      _latestResultsStreamController.stream;

  void getLatestTestResults() {
    _latestResultsStreamController.sink.add(LatestResultState.loading());
    PrioritiesUseCaseImpl().getAllTestResults().then((result) {
      _latestResultsStreamController.sink.add(result);
    });
  }

  void dispose() {
    _latestResultsStreamController.close();
  }
}
