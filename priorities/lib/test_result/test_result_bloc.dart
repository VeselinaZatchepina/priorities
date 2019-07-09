import 'package:priorities/domain/priorities_use_case_impl.dart';
import 'package:priorities/entities/latest_test_result.dart';

class TestResultBloc {

  void saveTestResult(TestResult testResult) {
    PrioritiesUseCaseImpl().saveTestResult(testResult);
  }

}