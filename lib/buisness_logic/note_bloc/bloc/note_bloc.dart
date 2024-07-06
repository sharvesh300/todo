import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note/data/models/noteModel.dart';
import 'package:note/data/repository/notes/noteRep.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final rep = NoteRep();

  NoteBloc() : super(NoteInitial()) {
    on<NoteEvent>((event, emit) {});
    on<AddNote>((event, emit) async {
      try {
        emit(NoteLoading());
        await rep.upload(event.model);
        emit(NoteSuccess());
      } catch (e) {
        emit(NoteError(e.toString()));
      }
    });
    on<EditNote>((event, emit) async {
      try {
        emit(NoteLoading());
        await rep.update(event.model, event.path);
        emit(NoteSuccess());
      } catch (e) {
        emit(NoteError(e.toString()));
      }
    });
    on<DeleteNote>((event, emit) async {
      try {
        emit(NoteLoading());
        await rep.delete(event.path);
        emit(NoteSuccess());
      } catch (e) {
        emit(NoteError(e.toString()));
      }
    });
  }

  @override
  void onChange(Change<NoteState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<NoteEvent, NoteState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
