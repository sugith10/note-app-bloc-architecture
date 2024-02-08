part of 'note_bloc.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteSuccess extends NoteState {
  final List<NoteModel> noteModels;
  NoteSuccess(this.noteModels);
}

final class NoteFail extends NoteState {
  final String error;
  NoteFail(this.error);
}

final class NoteLoading extends NoteState {}
