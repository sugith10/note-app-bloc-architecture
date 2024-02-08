import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class NoteDataProvider {
  Future<String> getNotes() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    try {
      final uri = Uri.parse(url);
      final res = await http.get(uri);
      return res.body;
    } catch (e) {
      log('error : $e');
      throw e.toString();
    }
  }

  Future<String> deleteNote(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    try {
      final uri = Uri.parse(url);
      final res = await http.delete(uri);
      return res.body;
    } catch (e) {
      log('delete error: $e');
      throw e.toString();
    }
  }

  Future<String> addNote(
      {required String title, required String content}) async {
    try {
      final body = {
        "title": title,
        "description": content,
        "is_completed": false,
      };
      const url = 'https://api.nstack.in/v1/todos';
      final uri = Uri.parse(url);
      final response = await http.post(uri,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> updateNote({
    required id,
    required String title,
    required String content,
  }) async {
    try {
      final body = {
        "title": title,
        "description": content,
        "is_completed": false,
      };

      final url = 'https://api.nstack.in/v1/todos/$id';
      final uri = Uri.parse(url);
      final response = await http.put(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}

// Future<void> updateTodo(String id) async {
//   final title = titleCntrl.text;
//   final content = contentCntrl.text;
//   final body = {"title": title, "description": content, "is_completed": false};

//   final url = 'https://api.nstack.in/v1/todos/$id';
//   final uri = Uri.parse(url);
//   final response = await http.put(uri,
//       body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

//   if (response.statusCode == 200) {
//     Navigator.pop(context);
//     print('Update Success');
//     Message().showSuccessMessage('Update Success', context);
//   } else {
//     print('Update Failed');
//     Message().showSuccessMessage('Update Failed', context);
//     print(response.body);
//   }
// }



// Future<void> submitData() async {
//   final title = titleCntrl.text;
//   final content = contentCntrl.text;
//   final body = {"title": title, "description": content, "is_completed": false};

//   final url = 'https://api.nstack.in/v1/todos';
//   final uri = Uri.parse(url);
//   final response = await http.post(uri,
//       body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

//   if (response.statusCode == 201) {
//     Navigator.pop(context);
//     print('Creation Success');
//     // Message().showSuccessMessage('Creation Success', context);
//   } else {
//     print('Creation Failed');
//     // Message().showSuccessMessage('Creation Failed', context);
//     print(response.body);
//   }
// }
