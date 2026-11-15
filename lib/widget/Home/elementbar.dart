import 'package:flutter/material.dart';

class CustomElementBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;
  final Color color;
  const CustomElementBar(
      {super.key,
        required this.text,
        required this.icon,
        required this.onPressed,
        required this.color});

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthscreen * 0.2,
      height: heightscreen * 0.06,
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
