import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note/data/models/noteModel.dart';
import 'package:note/data/repository/signIn/signRep.dart';
import 'package:note/presentation/home/note_page.dart';
import 'package:note/presentation/home/profile.dart';
import 'package:note/presentation/widgets/note_card.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> options = [
     NotePage(),
     ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
              enableFeedback: true,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurple,
          elevation: 5,
          onTap: _onItemTapped,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_alt,
                ),
                label: "Notes"),
            const BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person_2_rounded,
                ),
                label: "Account"),
          ],
        ),
        body: options.elementAt(_selectedIndex));
  }
}
