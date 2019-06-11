class TestResult {
  String _date;
  String _firstLevelPriority;
  String _secondLevelPriority;
  String _thirdLevelPriority;

  TestResult(this._date,
      this._firstLevelPriority,
      this._secondLevelPriority,
      this._thirdLevelPriority);

  String get date => _date;

  String get firstLevelPriority => _firstLevelPriority;

  String get secondLevelPriority => _secondLevelPriority;

  String get thirdLevelPriority => _thirdLevelPriority;

  setDate(String date) {
    _date = date;
  }

  setFirstLevelPriority(String firstLevelPriority) {
    _firstLevelPriority = firstLevelPriority;
  }

  setSecondLevelPriority(String secondLevelPriority) {
    _secondLevelPriority = secondLevelPriority;
  }

  setThirdLevelPriority(String thirdLevelPriority) {
    _thirdLevelPriority = thirdLevelPriority;
  }

}
