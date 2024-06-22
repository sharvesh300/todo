import 'package:flutter/material.dart';

class SignField extends StatelessWidget {
  const SignField({super.key});
  

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: ""
      ),
    );
  }
}
