import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/OnBoard/Learning-cuate.png'),
        Text(
          "5".tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff8CB0FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
        Text(
          '6'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xffF2B6CC),
            fontFamily: 'Pacifico',
          ),
        ),
      ],
    );
  }
}
