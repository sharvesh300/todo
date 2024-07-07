import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/buisness_logic/note_bloc/bloc/note_bloc.dart';
import 'package:note/data/models/noteModel.dart';
import 'package:note/data/models/userModel.dart';
import 'package:note/data/repository/notes/noteRep.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key, this.model, this.path});

  final NoteModel? model;
  final String? path;
  NoteRep rep = NoteRep();
  TextEditingController headController = TextEditingController();

  TextEditingController contentController = TextEditingController();
  final id = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (demo) {
        print(headController.text);
        print(contentController.text);
        if (path == null) {
          if (headController.text != '' || contentController.text != '') {
            print("Nothing you have entered");

            BlocProvider.of<NoteBloc>(context).add(AddNote(NoteModel(
                id: id,
                title: headController.text,
                content: contentController.text)));
          }
        } else if(headController.text != model?.title || contentController.text != model?.content) {
          BlocProvider.of<NoteBloc>(context).add(EditNote(
              NoteModel(
                  id: id,
                  content: contentController.text,
                  title: headController.text),
              path!));
        }
      },
      child: BlocConsumer<NoteBloc, NoteState>(listener: (context, state) {
        if (state is NoteSuccess) {
          print("success");
        } else if (state is NoteError) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) {
                return SnackBar(content: Text(state.error));
              });
        }
      }, builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                path != null
                    ? IconButton(
                        onPressed: () {
                          if (state != NoteLoading) {
                            BlocProvider.of<NoteBloc>(context)
                                .add(DeleteNote(path!));
                            Navigator.of(context).pop();
                          }
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ))
                    : Text('')
              ],
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.deepPurple,
              title: model == null
                  ? Text(
                      "New Note",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text("Edit Note", style: TextStyle(color: Colors.white)),
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    model?.title == null
                        ? TextField(
                            controller: headController,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                labelText: "Heading",
                                border: InputBorder.none),
                          )
                        : TextField(
                            controller: headController..text = model!.title!,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                labelText: "Heading",
                                border: InputBorder.none),
                          ),
                    Expanded(
                        child: model?.content == null
                            ? TextField(
                                controller: contentController,
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Content"),
                              )
                            : TextField(
                                controller: contentController
                                  ..text = model!.content!,
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Content"),
                              ))
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
