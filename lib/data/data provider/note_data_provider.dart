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

