import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_note/screen/add_todo.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchToDo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ToDo List')),
      ),
      body: Visibility(
        visible: isLoading,
       child: Center(child: CircularProgressIndicator()),
     replacement : RefreshIndicator(
          onRefresh: () => fetchToDo(),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '${index + 1}',
                  ),
                  backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                ),
                title: Text(item['title']),
                subtitle: Text(item['description']),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 40, 40, 40),
        shape: StadiumBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddToDoScrn(),
            ),
          );
        },
        label: Text(
          'Add To Do',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> fetchToDo() async {

    final url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'];
      setState(() {
         items = result;
      });
      print(result);
    }
    setState(() {
      isLoading = false;
    });
  }
}
