import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddToDoScrn extends StatelessWidget {
  AddToDoScrn({super.key});
  TextEditingController titleCntrl = TextEditingController();
  TextEditingController contentCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add ToDo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TextField(
            controller: titleCntrl,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: contentCntrl,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Content',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              submitData(context);
            },
            child: Text('Submit'),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(30, 50),
            ),
          )
        ],
      ),
    );
  }

  Future<void> submitData(BuildContext context) async {
    final title = titleCntrl.text;
    final content = contentCntrl.text;
    final body = {
      "title": title,
      "description": content,
      "is_completed": false
    };

    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      Navigator.pop(context);
      print('Creation Success');
      showSuccessMessage('Creation Success', context);
    } else {
      print('Creation Failed');
      showSuccessMessage('Creation Success', context);
      print(response.body);
    }
  }

  void showSuccessMessage(String message, BuildContext context){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}


