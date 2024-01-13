import 'package:http/http.dart' as http;
import 'package:new_note/model/user.dart';
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

      return User(
          email: e['email'],
          gender: e['gender'],
          nat: e['nat'],
          phone: e['phone'],
          name: name);
    }).toList();
    //hhjjhjhj
    print('fetch users completed');
    return users;
  }
}