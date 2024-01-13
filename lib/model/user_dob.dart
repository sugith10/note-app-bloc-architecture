class UserDob {
  final DateTime data;
  final int age;

  UserDob({
    required this.data,
    required this.age,
  });

  factory UserDob.fromMap(Map<String, dynamic> json) {
    final date = json['date'];
    return UserDob(
      data: DateTime.parse(date),
      age: json['age'],
    );
  }
}
