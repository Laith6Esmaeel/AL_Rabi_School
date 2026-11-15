import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String text;
  IconData icon;
  final TextEditingController textEditingController;
  CustomTextField(
      {super.key,
      required this.text,
      required this.icon,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            icon,
          ),
          hintText: text,
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
