import 'package:flutter/material.dart';
import 'package:shcool/Customs/textS.dart';


class CustomRowText extends StatelessWidget {
  final String text;
  final String text1;
  final IconData icon;
  final void Function() onPressed;
  final Color color;
  final double endpadding;
  final double startpadding;
  const CustomRowText(
      {super.key,
        required this.text,
        required this.icon,
        required this.onPressed,
        required this.color,
        required this.endpadding,
        required this.text1,
        required this.startpadding});

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: heightscreen * 0.02, start: widthscreen * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          CustomText(
              text: text,
              fontSize: 16,
              toppadding: 0,
              bottompadding: 0,
              color: Colors.black,
              startpadding: widthscreen * 0.02,
              endpadding: endpadding),
          CustomText(
              text: text1,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              toppadding: 0,
              bottompadding: 0,
              startpadding: startpadding,
              endpadding: endpadding),
        ],
      ),
    );
  }
}
