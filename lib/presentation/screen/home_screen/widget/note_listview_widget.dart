import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:new_note/model/note_model/note_model.dart';
import 'package:new_note/presentation/screen/view_note_screen/view_note_screen.dart';


class NoteList extends StatelessWidget {
  const NoteList({
    super.key,
    required this.noteList,
  });

  final List<NoteModel> noteList;

  @override
  Widget build(BuildContext context) {
    if (noteList.isEmpty) {
      log('empty');
      return const Center(
        child: Text(
          'No notes found',
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    return ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) {
          final note = noteList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ViewNotePage(
                        note: note,
                      )));
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
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              subtitle: Text(
                note.description,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        });
  }
}
