import 'package:firebase_auth/firebase_auth.dart';
import 'package:note/data/models/userModel.dart';

class SignInRep {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> signInWithEmail(
      {required String email, required String password,required String userName}) async {
   
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final UserModel
      ? user = UserModel(id: userCredential.user?.uid,email: email,userName: userName);
      return user;

   
  }

  Future<User?> loginWithEmail(
      {required String email, required String password}) async {
        
    final UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    return user;
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
