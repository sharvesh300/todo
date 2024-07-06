part of 'note_bloc.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {}

class NoteError extends NoteState {
  final String error;
  NoteError(this.error);
}
