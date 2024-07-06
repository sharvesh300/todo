import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note/data/models/noteModel.dart';

class NoteRep {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection("notes");
  Future<void> upload(NoteModel model) async {
    Map<String, dynamic> data = model.toJson();
    await firestore.add(data);
  }

  Future<void> update(NoteModel model, String? path) async {
    Map<String, dynamic> data = model.toJson();
    await firestore.doc(path).update(data);
  }

  Future<void> delete(String? path) async {
    await firestore.doc(path).delete();
  }
}
