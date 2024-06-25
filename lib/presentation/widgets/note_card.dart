import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  NoteCard({
    super.key,
    this.onTap,
   required this.content,
   required this.title
  });

  final String title;
  final String content;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.amber),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
             Text(content),
          ],
        ),
      ),
    );
  }
}
