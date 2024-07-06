part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class AddNote extends NoteEvent {
  final NoteModel model;

  AddNote(this.model);
}

class DeleteNote extends NoteEvent {
  final String path;
  DeleteNote(this.path);
}

class EditNote extends NoteEvent {
  final NoteModel model;
  final String path;
  EditNote(this.model, this.path);
}
