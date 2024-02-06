import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<AddNote>(((event, emit) {}));

    on<GetNote>(((event, emit) {}));

    on<UpdateNote>(((event, emit) {}));

    on<DeleteNote>(((event, emit) {}));
  }
}
