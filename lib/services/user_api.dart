import 'package:http/http.dart' as http;
import 'package:new_note/model/user.dart';
import 'dart:convert';


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
      return User.fromMap(e);
    }).toList();
    //hhjjhjhj
    print('fetch users completed');
    return users;
  }
}