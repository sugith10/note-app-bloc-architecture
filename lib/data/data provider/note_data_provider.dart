import 'dart:developer';
import 'package:http/http.dart' as http;

class NoteDataProvider{
  Future<String> getNotes() async{
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
    try{
      final uri = Uri.parse(url);
      final res = await http.get(uri);
      return res.body;
    }catch(e){
      log('error : $e');
      throw e.toString();
    }
  }
  
}