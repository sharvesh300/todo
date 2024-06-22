import 'package:flutter/material.dart';
import 'package:note/data/repository/signIn/signRep.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: ElevatedButton(
          child: Text("LogOut"),
          onPressed: () {
            SignInRep().logout();
          },
        ),
      ),
    ));
  }
}
