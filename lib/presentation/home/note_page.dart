import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/buisness_logic/auth/auth_cubit.dart';
import 'package:note/buisness_logic/note_bloc/bloc/note_bloc.dart';
import 'package:note/data/models/noteModel.dart';
import 'package:note/presentation/home/edit_page.dart';
import 'package:note/presentation/widgets/note_card.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});
  String id = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final stateA = BlocProvider.of<AuthCubit>(context).state;
    print(stateA);
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
              if (snapshot.data?.docs.length != 0) {
                print(snapshot.data?.docs.length);
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
              print(snapshot.data?.docs.length);
              print(snapshot.hasData);
              return Center(child: Text("Add a note",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: const Color.fromARGB(255, 174, 174, 174)),));
            }),
      ),
    );
  }
}
