import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:shcool/Controllers/Reset-Controller.dart';
import 'package:shcool/Customs/Custom_Button.dart';
import 'package:shcool/Customs/Custom_TextF.dart';
import 'package:shcool/Screens/Login_Screen.dart';

class Forget_reset extends StatelessWidget {
  const Forget_reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 70),
          child: Text(
            "45".tr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            "46".tr,
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 30),
          child: Text(
            '37'.tr,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: CustomTextField(
            textEditingController: ResetPasswordConttroller.emailController,
            text: '38'.tr,
            icon: Icons.lock,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 30),
          child: Text(
            "47".tr,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: CustomTextField(
            textEditingController: ResetPasswordConttroller.passwordController,
            text: "48".tr,
            icon: Icons.lock,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 30),
          child: Text(
            '97'.tr,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: CustomTextField(
            textEditingController:
                ResetPasswordConttroller.coPasswordController,
            text: "48".tr,
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
            text: "49".tr,
            onPressed: () {
              ResetPasswordConttroller.ResetPassowrd();
            },
          ),
        )
      ],
    ));
  }
}
