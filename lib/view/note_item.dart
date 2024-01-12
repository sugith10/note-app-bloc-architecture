import 'package:flutter/material.dart';
import 'package:new_note/view/screen_add_note.dart';

class NoteItem extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  const NoteItem(
      {required this.id,
      required this.title,
      required this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AddNotesScrn(
              type: ActionType.EditNote,
              id: id,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete))
              ],
            ),
            Text(
              content,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14
              ),
            )
          ],
        ),
      ),
    );
  }
}
