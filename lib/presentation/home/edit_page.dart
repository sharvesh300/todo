import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key, this.content, this.heading});

  final String? heading;
  final String? content;

 
   TextEditingController headController = TextEditingController();

 TextEditingController contentController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
          appBar: AppBar(
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
            title: heading == null && content == null
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
                  TextField(
                    controller: headController.text == null ? headController : headController..text = heading!,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        labelText: "Heading",
                        border: InputBorder.none),
                  ),
                  Expanded(
                      child: TextField(
                       controller:contentController.text == null ? contentController : contentController..text = content!,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none, labelText: "Content"),
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
