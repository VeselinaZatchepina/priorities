class TestResult {
  int id = 0;
  int _date;
  String _firstLevelPriority;
  String _secondLevelPriority;
  String _thirdLevelPriority;

  TestResult(this._date, this._firstLevelPriority, this._secondLevelPriority,
      this._thirdLevelPriority,
      [this.id]);

  int get date => _date;

  String get firstLevelPriority => _firstLevelPriority;

  String get secondLevelPriority => _secondLevelPriority;

  String get thirdLevelPriority => _thirdLevelPriority;

  setDate(int date) {
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

  factory TestResult.fromJson(Map<String, dynamic> json) => TestResult(
      json["date"],
      json["firstLevelPriority"],
      json["secondLevelPriority"],
      json["thirdLevelPriority"],
      json["id"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "firstLevelPriority": firstLevelPriority,
        "secondLevelPriority": secondLevelPriority,
        "thirdLevelPriority": thirdLevelPriority
      };
}
