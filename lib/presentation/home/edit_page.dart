import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Note"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      labelText: "Heading",
                      border: InputBorder.none),
                ),
                Expanded(
                    child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none, labelText: "Content"),
                ))
              ],
            ),
          ),
        ));
  }
}
