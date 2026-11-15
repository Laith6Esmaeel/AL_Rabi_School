import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key,
      required this.image,
      required this.color,
      required this.text,
      required this.onTap});
  final String image;
  final Color color;
  final String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 220,
          width: 140,
          child: Stack(
            children: [
              Padding(

                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  image,
                 // fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 79),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: color),
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
