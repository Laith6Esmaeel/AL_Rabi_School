import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GHomeCard extends StatelessWidget {
  GHomeCard(
      {super.key, required this.text, required this.icon, required this.onTap});
  OnTap onTap;
  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 30, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
