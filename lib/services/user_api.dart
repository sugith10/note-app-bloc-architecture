import 'package:http/http.dart' as http;
import 'package:new_note/model/user.dart';
import 'package:new_note/model/user_dob.dart';
import 'package:new_note/model/user_location.dart';
import 'dart:convert';
import 'package:new_note/model/user_name.dart';

class UserApi{
  static Future<List<User>> fetchUsers() async {
    print('fetchUsers called');
    const address = 'https://randomuser.me/api/?results=25';
    final url = Uri.parse(address);
    final response = await http.get(url);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    //jjjjk
    final users = results.map((e) {

      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final date = e['dob']['date'];

      final dob = UserDob(
        data:  DateTime.parse(date), 
        age: e['dob']['age'],);

      final street = LocationStreet(
        latitude: e['location']['coordinates']['latitude'].toString(), 
        longitude: e['location']['coordinates']['longitude'].toString(),
        );
      final timezone = LocationTimeZone(
        offest: e['location']['timezone']['offset'].toString(), 
        description: e['location']['timezone']['description'],
        );
      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        // postcode: e['loation']['postcode'].toString(), 
        street: street, 
        timeZone: timezone,
        );
      return User(
          email: e['email'],
          gender: e['gender'],
          nat: e['nat'],
          phone: e['phone'],
          name: name,
          dob: dob,
          location: location,
          );
    }).toList();
    //hhjjhjhj
    print('fetch users completed');
    return users;
  }
}