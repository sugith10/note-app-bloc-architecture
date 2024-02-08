import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:new_note/data/repository/note_repository.dart';
import 'package:new_note/model/note_model/note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteRepository noteRepository;
  NoteBloc(this.noteRepository) : super(NoteInitial()) {
    on<AddNote>(
      ((event, emit) async {}),
    );

    on<GetNote>(((event, emit) async {
      emit(NoteLoading());
      try {
        final notes = await noteRepository.getNotes();
        emit(NoteSuccess(notes));
      } catch (e) {
        emit(NoteFail(e.toString()));
      }
    }));

    on<UpdateNote>(((event, emit) async {}));

    on<DeleteNote>(
      ((event, emit) async {
      emit(NoteLoading());
      try{
        final id = event.id;
        final notes = await noteRepository.deleteNotes(id);
        emit(NoteSuccess(notes));
      }catch(e){
        emit(NoteFail(e.toString()));
      }
    }));
  }
}
