import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Customs/Custom_Button.dart';
import 'package:shcool/Customs/Custom_rebitHomework.dart';
import 'package:shcool/Screens/Announsmant_screen.dart';
import 'package:shcool/Screens/Gardian/Attendance_Screen.dart';
import 'package:shcool/Screens/Gardian/Studentsmarks_screen.dart';

class CustomHomework extends StatelessWidget {
  const CustomHomework({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => AnnounsmantScreen(gradientColors: [Color(0xff8CB0FF), Color(0xffF2B6CC)],));
          },
          child: CustomRebithomework(
            colorss: [Color(0xff8CB0FF), Color(0xffF2B6CC)],
            title: "25".tr,
            image: "assets/home/Taking notes-rafiki.png",
            onpressed: () {
              Get.to(() => AnnounsmantScreen(gradientColors: [Color(0xff8CB0FF), Color(0xffF2B6CC)],));
            },
            bgColor: Color(0xff8CB0FF),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: (){
              Get.to(() =>AttendancePage ());
          },
          child: CustomRebithomework(
            colorss: [Color(0xff8CB0FF), Color(0xffF2B6CC)],
            title: "26".tr,
            image: "assets/home/Questions-amico.png",
            onpressed: () {
              Get.to(() =>AttendancePage ());
            },
           bgColor:  Color(0xff8CB0FF),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap:() => Get.to(() => StudentMarks()) ,
          child: CustomRebithomework(
            colorss: [Color(0xff8CB0FF), Color(0xffF2B6CC)],
            title: "27".tr,
            image: "assets/home/Exams-amico.png",
            onpressed: () => Get.to(() => StudentMarks()),
            bgColor: Color(0xff8CB0FF),
          ),
        ),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
