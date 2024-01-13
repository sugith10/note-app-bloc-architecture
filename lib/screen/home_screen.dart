import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Rest API',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
        final user = users[index];
        final email = user['email'];
        final name = user['name']['first'];
        final picture = user['picture']['thumbnail'];
        return ListTile(
        leading: CircleAvatar(child: Text('${index+1}'),backgroundColor: Colors.grey,),
        title: Text(name),
        subtitle: Text(email),
        trailing: Image.network(picture),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
        },
        backgroundColor: Colors.white,
        shape: CircleBorder(side: BorderSide(strokeAlign: 0.5)),
      ),
    );
  }

  void fetchUsers()async {
    print('fetchUsers called');
    const address = 'https://randomuser.me/api/?results=110';
    final url = Uri.parse(address);
    final response = await http.get(url);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('fetch users completed');
  }
}
