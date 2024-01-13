class UserName {
  final String title;
  final String first;
  final String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });

  factory UserName.fromMap(Map <String, dynamic> e){
    return UserName(
        title: e['title'],
        first: e['first'],
        last: e['last']);
  }
}
