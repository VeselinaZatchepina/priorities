import 'package:priorities/database/database_provider.dart';
import 'package:priorities/entities/latest_test_result.dart';
import 'package:priorities/state/state.dart';
import 'priorities_repository.dart';

class PrioritiesRepositoryImpl implements PrioritiesRepository {
  @override
  Future<LatestResultState> getAllTestResults() async {
    return await DatabaseProvider.dbProvider.getAllTestResults().then((result) {
      List<TestResult> results = List();
      for (TestResult testResult in result) {
        results.add(testResult);
      }
      return LatestResultState.success(results);
    }).catchError((error) {
      print(error.toString());
      return LatestResultState.error();
    });
  }

  @override
  Future<LatestResultState> saveTestResult(TestResult testResult) async {
    return await DatabaseProvider.dbProvider
        .saveTestResult(testResult)
        .then((int) {
      return LatestResultState.success([]);
    }).catchError((error) {
      print(error.toString());
      return LatestResultState.error();
    });
  }
}
