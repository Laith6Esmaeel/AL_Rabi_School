import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/OnBoard/Learning-amico.png'),
          Text(
            "3".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Color(0xff8CB0FF),
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
          Text(
            "4".tr,
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
