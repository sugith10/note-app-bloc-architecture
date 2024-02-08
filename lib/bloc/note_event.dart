part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

class AddNote extends NoteEvent {
  final String title;
  final String content;

  AddNote({required this.title, required this.content});
}

class GetNote extends NoteEvent {}

class UpdateNote extends NoteEvent {
  final String id;
  final String title;
  final String content;
  UpdateNote({
    required this.id,
    required this.title,
    required this.content,
  });
}

class DeleteNote extends NoteEvent {
  final String id;
  DeleteNote({required this.id});
}
