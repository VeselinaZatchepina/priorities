import 'package:priorities/entities/latest_test_result.dart';

class LatestResultState {
  LatestResultState();

  factory LatestResultState.success(List<TestResult> testResults) =>
      LatestResultSuccess(testResults);

  factory LatestResultState.loading() => LatestResultLoading();

  factory LatestResultState.error() => LatestResultError();

  factory LatestResultState.init() => LatestResultInit();
}

class LatestResultInit extends LatestResultState {}

class LatestResultLoading extends LatestResultState {}

class LatestResultSuccess extends LatestResultState {
  LatestResultSuccess(this.testResults);

  final List<TestResult> testResults;
}

class LatestResultError extends LatestResultState {}
