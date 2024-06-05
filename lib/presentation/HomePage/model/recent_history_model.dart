class RecentHistoryModel {
  final String name;
  final String age;
  final String date;
  final String weight;
  final String gender;
  final String title;
  final String code;

  RecentHistoryModel(this.name, this.age, this.date, this.weight, this.gender,
      this.title, this.code);

  @override
  String toString() {
    return 'RecentHistoryModel(name: $name, age: $age, date: $date, weight: $weight, gender: $gender, title: $title, code: $code)';
  }
}
