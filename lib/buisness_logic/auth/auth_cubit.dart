import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note/data/models/userModel.dart';
import 'package:note/data/repository/signIn/signRep.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final SignInRep rep = SignInRep();

  Future<void> signUp(String email, String password, String userName) async {
    try {
      emit(AuthLoading());
      UserModel? userModel = await rep.signInWithEmail(
          email: email, password: password, userName: userName);

      print(userModel);
      emit(AuthSuccess(user: userModel));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      UserModel? userModel = await rep.loginWithEmail(
          email: email, password: password,);
      emit(AuthSuccess(user: userModel));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(message: e.message));
    }
  }
}
