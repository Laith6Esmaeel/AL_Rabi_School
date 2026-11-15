import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/Verify-Controllers.dart';
import 'package:shcool/Customs/Custom_Button.dart';
import 'package:shcool/Customs/Custom_TextF.dart';
import 'package:shcool/Screens/Forget_reset.dart';

class Forget_check extends StatelessWidget {
  const Forget_check({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 70),
            child: Text(
              "40".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "41".tr,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Text(
              "42".tr,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomTextField(
              textEditingController: VerifyCodeConttroller.emailController,
              text: "38".tr,
              icon: Icons.email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomTextField(
              textEditingController: VerifyCodeConttroller.numberController,
              text: "43".tr,
              icon: Icons.lock,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75, right: 75, top: 20),
            child: Custum_Button(
              colors: [
                Color(0xff8CB0FF),
                Color(0xffF2B6CC),
              ],
              text: "44".tr,
              onPressed: () {
                VerifyCodeConttroller.checkNumber();
              },
            ),
          )
        ],
      ),
    );
  }
}
