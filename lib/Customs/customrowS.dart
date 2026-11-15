
import 'package:flutter/material.dart';
import 'package:shcool/Customs/textS.dart';


class CustomRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onPressed;
  final Color color;
  final double ? endpadding;
  final Widget? trailing;
  const CustomRow(
      {super.key,
        required this.text,
        required this.icon,
        required this.onPressed,
        required this.color,
         this.endpadding,
        this.trailing,
      });

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: heightscreen * 0.01, start: widthscreen * 0.02),
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
              color: Colors.black,
              toppadding: 0,
              bottompadding: 0,
              startpadding: widthscreen * 0.02,
              endpadding: endpadding ??0),
                SizedBox(width: 8,),
          
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.chevron_right_outlined,
              size: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
