import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/themecontroller.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/OnBoard/college students-rafiki (6).png'),
          Text(
            '1'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Color(0xff8CB0FF),
              fontWeight: FontWeight.bold,
              //  fontFamily: 'Pacifico',
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
          Text(
            '2'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffF2B6CC),
              fontFamily: 'Pacifico',
            ),
          ),
        ],
      ),
    );
  }
}
