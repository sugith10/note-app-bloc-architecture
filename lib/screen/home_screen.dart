import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_note/screen/add_todo.dart';
import 'package:http/http.dart' as http;
import 'package:new_note/util/msg.dart';

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
        replacement: RefreshIndicator(
          onRefresh: () => fetchToDo(),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 38, 38, 38),
                  child: Text(
                    '${index + 1}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                title: Text(
                  item['title'],
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  item['description'],
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: PopupMenuButton(onSelected: (value) {
                  if (value == 'edit') {
                    navigateToEditPage(item);
                  } else if (value == 'delete') {
                    delete(id);
                  }
                }, itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ];
                }),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 40, 40, 40),
        shape: const StadiumBorder(),
        onPressed: () {
        navigateToAddPage();
        },
        label: Text(
          'Add To Do',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> fetchToDo() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'];
      setState(() {
        items = result;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> delete(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
      // ignore: use_build_context_synchronously
      Message().showSuccessMessage('Successfully Deleted', context);
      print('remove success');
    } else {
      // ignore: use_build_context_synchronously
      Message().showSuccessMessage('Deletion Failed', context);
      print('remove failed');
    }
  }

  void navigateToEditPage(Map item,) async {
    print('function start');
    final route = MaterialPageRoute(builder: (context) => AddToDoScrn(todo: item ));
    Navigator.push(context, route);

  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(builder: (context) => const AddToDoScrn());
   await Navigator.push(context, route);
   setState(() {
     isLoading = true;
   });
   fetchToDo();
  }
}
