import 'package:priorities/domain/priorities_use_case.dart';
import 'package:priorities/entities/latest_test_result.dart';
import 'package:priorities/repositories/priorities_repository_impl.dart';
import 'package:priorities/state/state.dart';

class PrioritiesUseCaseImpl implements PrioritiesUseCase {

  /// Получение истории результатов тестов.
  @override
  Future<LatestResultState> getAllTestResults() {
    return PrioritiesRepositoryImpl().getAllTestResults();
  }

  /// Добавление информации о последнем результате теста.
  @override
  Future<LatestResultState> saveTestResult(TestResult testResult) {
    return PrioritiesRepositoryImpl().saveTestResult(testResult);
  }

}