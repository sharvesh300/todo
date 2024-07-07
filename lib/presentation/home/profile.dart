import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note/data/models/userModel.dart';
import 'package:note/data/repository/notes/noteRep.dart';
import 'package:note/data/repository/signIn/signRep.dart';

class ProfilePage extends StatelessWidget {
  final UserModel model;
  ProfilePage({super.key,required this.model});

  User? user = FirebaseAuth.instance.currentUser;
  final rep = SignInRep();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name:",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    model.userName!,
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Email:",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    model.email!,
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await rep.logout();
                  },
                  child: Text("SignOut"))
            ],
          ),
        ),
      ),
    );
  }
}
