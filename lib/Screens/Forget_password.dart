import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/Forget-Controller.dart';
import 'package:shcool/Customs/Custom_Button.dart';
import 'package:shcool/Customs/Custom_TextF.dart';
import 'package:shcool/Screens/Forget_check.dart';

class Forget_password extends StatelessWidget {
  const Forget_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 70),
            child: Text(
              "35".tr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "36".tr,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 30),
            child: Text(
              "37".tr,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomTextField(
              textEditingController: ForgetPasswordController.emailController,
              text: "38".tr,
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
              text: "39".tr.camelCase,
              onPressed: () {
                ForgetPasswordController.check();
              },
            ),
          )
        ],
      ),
    );
  }
}
