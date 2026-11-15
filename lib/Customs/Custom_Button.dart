import 'package:flutter/material.dart';

class Custum_Button extends StatelessWidget {
  const Custum_Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.colors,
  });

  final String? text;
  final void Function() onPressed;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
