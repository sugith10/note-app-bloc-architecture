import 'package:new_note/model/user_dob.dart';
import 'package:new_note/model/user_location.dart';
import 'package:new_note/model/user_name.dart';

class User {
  final String gender;
  final String phone;
  final String email;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;

  User(
      {required this.name,
      required this.gender,
      required this.phone,
      required this.email,
      required this.nat,
      required this.dob,
      required this.location});

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);

    final dob = UserDob.fromMap(e['dob']);

    final location = UserLocation.fromMap(e['location']);

    return User(
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
