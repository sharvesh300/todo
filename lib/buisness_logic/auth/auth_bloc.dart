import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:note/data/models/userModel.dart';
import 'package:note/data/repository/signIn/signRep.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInRep rep = SignInRep();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading(isLoading: true));
      try {
        final UserModel? user = await rep.signInWithEmail(
            userName: event.userName,
            email: event.email,
            password: event.password);
        print(user);
        emit(AuthLoading(isLoading: false));
        emit(AuthSuccess(user: user));

      } on FirebaseAuthException catch (e) {
        emit(AuthLoading(isLoading: false));
        emit(AuthError(errorMessage: e.message));
      }
    });
  }
}
