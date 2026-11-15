import 'package:flutter/material.dart';

class CustomBuildstatcard extends StatelessWidget {
  CustomBuildstatcard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  final String title;
  final String count;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         gradient: LinearGradient(colors: [
                Color(0xffF2B6CC),
                Color(0xff8CB0FF),
              ]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(count,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(title, style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
