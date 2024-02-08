import 'dart:convert';
import 'dart:developer';
import 'package:new_note/data/data%20provider/note_data_provider.dart';
import 'package:new_note/model/note_model/note_model.dart';

class NoteRepository{
  final NoteDataProvider noteDataProvider;
  NoteRepository(this.noteDataProvider);

  Future<List<NoteModel>> getNotes() async {
    try{
      final noteData = await noteDataProvider.getNotes();
      final data = jsonDecode(noteData);

      if(data['code'] != 200){
        throw 'An unexpected error occurred';
      }

      final List<dynamic> items = data['items'];
      final List<NoteModel> notes = items.map((item) => NoteModel.fromMap(item)).toList();
      return notes;
    }catch(e){
      log('error: $e');
      throw e.toString();
    }
  }

  Future<List<NoteModel>> deleteNotes(String id)async{
    try{
      final noteData = await noteDataProvider.deleteNote(id);
      final data = jsonDecode(noteData);
      if(data['code'] != 200){
       return throw('An unexpected erro occured');
      }
      log('$data');
      print(data);
      return getNotes();
    }catch(e){
      log('error: $e');
      throw e.toString();
    }
  }
}