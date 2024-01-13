import 'package:new_note/model/user_name.dart';

class User {
  final String gender;
  final String phone;
  final String email;
  final String nat;
  final UserName name;

  User({
    required this.name,
    required this.gender,
    required this.phone,
    required this.email,
    required this.nat,
  });

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}

