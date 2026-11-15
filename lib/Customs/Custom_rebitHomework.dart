import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Customs/Custom_Button.dart';

class CustomRebithomework extends StatelessWidget {
  CustomRebithomework(
      {super.key,
      required this.title,
      required this.image,
      required this.onpressed,
      required this.colorss,
       required this.bgColor,});
  final String title;
  final String image;
  final void Function() onpressed;
  final List<Color> colorss;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
         color: bgColor,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50, top: 30, left: 40),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                //  fontFamily: 'Pacifico',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 240, top: 15),
            child: Container(
              height: 170,
              width: 140,
              child: Image.asset(image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 140, top: 100),
            child: Custum_Button(
              colors: colorss,
              text: '35'.tr,
              onPressed: () {
                onpressed;
              },
            ),
          ),
        ],
      ),
    );
  }
}
