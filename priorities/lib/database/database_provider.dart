import 'dart:io';
import 'package:path/path.dart';
import 'package:priorities/entities/latest_test_result.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider dbProvider = DatabaseProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Priorities.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE TestResult ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "date INTEGER,"
          "firstLevelPriority TEXT,"
          "secondLevelPriority TEXT,"
          "thirdLevelPriority TEXT"
          ")");
    });
  }

  /// Добавление информации о последнем результате теста.
  Future<int> saveTestResult(TestResult testResult) async {
    final db = await database;
    var res = await db.transaction((txn) async {
      await txn.rawInsert(
          'INSERT Into TestResult(date, firstLevelPriority, secondLevelPriority, thirdLevelPriority) VALUES(?, ?, ?, ?)',
          [
            testResult.date,
            testResult.firstLevelPriority,
            testResult.secondLevelPriority,
            testResult.thirdLevelPriority
          ]);
    });
    return res;
  }

  /// Получение истории результатов тестов.
  Future<List<TestResult>> getAllTestResults() async {
    final db = await database;
    List<TestResult> resultList = List();
    List<Map> testResultMaps = await db.rawQuery('SELECT * FROM TestResult');
    for (Map testResultInfo in testResultMaps) {
      resultList.add(TestResult.fromJson(testResultInfo));
    }
    return resultList;
  }
}
