part of 'note_bloc.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteSuccess extends NoteState {}

final class NoteFail extends NoteState {}

final class NoteLoading extends NoteState {}
