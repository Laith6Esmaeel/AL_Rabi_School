import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Customs/Custom_rebitHomework.dart';
import 'package:shcool/Screens/Announsmant_screen.dart';
import 'package:shcool/Screens/Gardian/Complaints_Screen.dart';
import 'package:shcool/Screens/Teacher/SubmitNote_Screen.dart';

class CustomHometeacher extends StatelessWidget {
  const CustomHometeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => AnnounsmantScreen(
                gradientColors: [Color(0xff7A4012), Color(0xffE4DDC1)],
              )),
          child: CustomRebithomework(
            colorss: [Color(0xff7A4012), Color(0xffE4DDC1)],
            title: "25".tr,
            image: "assets/HomeTeacher/Taking notes-rafiki (1).png",
            onpressed: () {
              Get.to(() => AnnounsmantScreen(
                    gradientColors: [Color(0xff7A4012), Color(0xffE4DDC1)],
                  ));
            },
            bgColor: Color(0xff7A4012),
          ),
        ),
        SizedBox(
          width: 30,
        ),
  
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () => Get.to(() => ComplaintsScreen(
                gradientColors: [Color(0xff7A4012), Color(0xffE4DDC1)],
                textFieldColor: Color(0xffE4DDC1),
              )),
          child: CustomRebithomework(
            colorss: [Color(0xff7A4012), Color(0xffE4DDC1)],
            title: "29".tr,
            //  title: "Submit a complaint",
            image: "assets/HomeTeacher/Notes-rafiki.png",
            onpressed: () {
              Get.to(() => ComplaintsScreen(
                    gradientColors: [Color(0xff7A4012), Color(0xffE4DDC1)],
                    textFieldColor: Color(0xffE4DDC1),
                  ));
            },
            bgColor: Color(0xff7A4012),
          ),
        ),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
