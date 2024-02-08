import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_note/bloc/note_bloc.dart';
import 'package:new_note/presentation/screen/add_or_edit_screen/add_or_edit_screen.dart';
import 'package:http/http.dart' as http;
import 'package:new_note/presentation/screen/view_note_screen/view_note_screen.dart';
import 'package:new_note/util/msg.dart';
import 'package:page_transition/page_transition.dart';

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
        title: const Text('My Notes'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NoteBloc>().add(GetNote());
            },
            icon: const Icon(Icons.replay_rounded),
          )
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
            child: CircularProgressIndicator(
              color: Colors.brown,
            ),
          );
        }

        final notes = state.noteModels;
        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return GestureDetector(
                
                onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ViewNotePage(
                          note: note,
                        )));
                        print(note.id);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 151, 108, 93),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  title: Text(
                    note.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  subtitle: Text(
                    note.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton.extended(
        shape: const StadiumBorder(),
        onPressed: () {
          navigateToAddPage();
        },
        label: const Text(
          'Add Note',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  empty() {}



  Future<void> navigateToAddPage() async {
    await Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: const AddToDoScrn(),
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400)),
    );
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