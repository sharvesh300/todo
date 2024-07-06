import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/buisness_logic/note_bloc/bloc/note_bloc.dart';
import 'package:note/data/models/noteModel.dart';
import 'package:note/presentation/home/edit_page.dart';
import 'package:note/presentation/widgets/note_card.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});
  String id = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => NoteBloc(),
                        child: EditPage(),
                      )));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("notes")
                .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                return GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: snapshot.data!.docs
                      .map((note) => NoteCard(
                          onTap: () {
                            final model = NoteModel.fromJson(note.data());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => NoteBloc(),
                                          child: EditPage(
                                            path: note.id,
                                            model: model,
                                          ),
                                        )));
                          },
                          content: note["content"],
                          title: note["title"]))
                      .toList(),
                );
              }
              if (snapshot.hasData == false) {
                return Center(
                  child: Text("No note available"),
                );
              }
              return Text("hi");
            }),
      ),
    );
  }
}
