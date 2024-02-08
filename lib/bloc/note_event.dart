part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

class AddNote extends NoteEvent {}

class GetNote extends NoteEvent {}

class UpdateNote extends NoteEvent {}

class DeleteNote extends NoteEvent {
  final String id;
  DeleteNote({required this.id});
}