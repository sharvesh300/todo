import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:note/data/models/userModel.dart';

class SignInRep {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Stream<User?> user() async* {
    firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? null : firebaseUser;
      return user;
    });
  }

  Future<UserModel?> signInWithEmail(
      {required String email,
      required String password,
      required String userName}) async {
    final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    final UserModel? user = UserModel(
        id: userCredential.user?.uid, email: email, userName: userName);
    await firebaseAuth.currentUser?.updateDisplayName(userName);
    print(firebaseAuth.currentUser?.displayName);
    return user;
  }

  Future<UserModel?> loginWithEmail(
      {required String email, required String password}) async {
    final UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    final UserModel? user = UserModel(
        id: userCredential.user?.uid,
        userName: userCredential.user?.displayName,
        email: email);
    return user;
  }

  Future<void> googleSignIn() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        idToken: gAuth!.idToken, accessToken: gAuth.accessToken);
    await firebaseAuth.signInWithCredential(credential);
  
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
