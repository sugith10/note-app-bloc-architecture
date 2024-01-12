import 'package:flutter/material.dart';

enum ActionType{
  AddNote,
  EditNote,
}


class AddNotesScrn extends StatelessWidget {
  final ActionType type;
  String? id;
 AddNotesScrn({required this.type, this.id, super.key});

  Widget get saveButton => TextButton.icon(onPressed: (){
    switch(type){
      case ActionType.AddNote:
      //add note
        break;
      case ActionType.EditNote:
      //edit note
        break;
    }
  }, icon: Icon(Icons.save), label: Text('Save', style: TextStyle(color: Colors.white),));
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(type.name.toUpperCase(),
        style: TextStyle(color: Colors.white),
        ),
        actions: [saveButton],
        backgroundColor: Colors.black,
      ),
      body: SafeArea(child: 
        Padding(padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              maxLines: 4,
              maxLength: 100,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Content',
              ),
            )
          ],
        ),
        
        ),
        
      ),
    );
  }
}