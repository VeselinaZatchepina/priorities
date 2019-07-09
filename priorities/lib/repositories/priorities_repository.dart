import 'package:priorities/entities/latest_test_result.dart';
import 'package:priorities/state/state.dart';

abstract class PrioritiesRepository {

  Future<LatestResultState> getAllTestResults();

  Future<LatestResultState> saveTestResult(TestResult testResult);

}