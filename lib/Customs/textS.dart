import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double toppadding;
  final double bottompadding;
  final double startpadding;
  final double endpadding;
  final TextAlign? textAlign;
  final TextOverflow? overflow ;
  const CustomText(
      {super.key,
        required this.text,
        required this.fontSize,
        this.fontWeight,
        this.color,
        required this.toppadding,
        required this.bottompadding,
        required this.startpadding,
        required this.endpadding,
        this.textAlign, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: toppadding,
          end: endpadding,
          start: startpadding,
          bottom: bottompadding),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          overflow: overflow ,
        ),
      ),
    );
  }
}
