class Person {
  final String name;
  final String role;
  final String motherLang;

  Person({this.name, this.role, this.motherLang});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        name: json['name'], role: json['role'], motherLang: json['motherLang']);
  }
}
