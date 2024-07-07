import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  NoteCard({super.key, this.onTap, required this.content, required this.title});

  final String title;
  final String content;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color.fromARGB(255, 252, 222, 133),
      const Color.fromARGB(255, 120, 246, 124),
      Color.fromARGB(255, 122, 224, 252),
      Color.fromARGB(255, 254, 102, 91)
    ];
    Color randomColor = (colors.toList()..shuffle()).first;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: randomColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              content,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
