import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_note/bloc/note_bloc.dart';
import 'package:new_note/presentation/screen/add_todo.dart';
import 'package:http/http.dart' as http;
import 'package:new_note/util/msg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    context.read<NoteBloc>().add(GetNote());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:const Text('My Notes'),
        actions: [
          IconButton(onPressed: (){
             context.read<NoteBloc>().add(GetNote());
          }, icon: const Icon(Icons.replay_rounded))
        ],
      ),
      body: BlocBuilder<NoteBloc, NoteState>(builder: (context, state) {
        if (state is NoteFail) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is! NoteSuccess) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final notes = state.noteModels;
        return ListView.builder(
            itemCount: notes.length, itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                 leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 151, 108, 93),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                title: Text(
                  note.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                  ),
                ),
                subtitle: Text(
                 note.description,
                   style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        shape: const StadiumBorder(),
        onPressed: () {
          navigateToAddPage();
        },
        label: const Text(
          'Add To Do',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  empty() {}



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

  void navigateToEditPage(
    Map item,
  ) async {
    print('function start');
    final route =
        MaterialPageRoute(builder: (context) => AddToDoScrn(todo: item));
    Navigator.push(context, route);
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(builder: (context) => const AddToDoScrn());
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    //  fetchToDo();
  }
}




/*

ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'];
              return ListTile(
               
                

                trailing: PopupMenuButton(
                  color: const Color.fromARGB(255, 204, 165, 150),
                  onSelected: (value) {
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
          )

*/