import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shcool/Customs/Custom_Gcard.dart';
import 'package:shcool/Customs/Custom_HomeTeacher.dart';
import 'package:shcool/Screens/AI_screen.dart';
import 'package:shcool/Screens/Teacher/AllStudents.dart';
import 'package:shcool/Screens/Teacher/RebortsTeacher_Screen.dart';
import 'package:shcool/Screens/Teacher/SearchAboutStudent.dart';
import 'package:shcool/Screens/Teacher/TSubjectSchdule.dart';
import 'package:shcool/Screens/Teacher/UploadHomework_Screen.dart';

class THomepage extends StatelessWidget {
  const THomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE4DDC1),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 55),
                child: Text(
                  "14".tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 200,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: IconButton(
              //       onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
              // )
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Image.asset(
                    "assets/HomeTeacher/Learning (4).gif",
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40, left: 5, top: 10),
                    child: Container(
                      width: 150,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Color(0xffE4DDC1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 90,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff7A4012),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              "15".tr,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff7A4012),
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: CustomHometeacher(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              "16".tr,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff7A4012),
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          Container(
            height: 400,
            child: GridView(
              children: [
                CustomCard(
                  image: "assets/HomeTeacher/Schedule-rafiki (1).png",
                  text: "17".tr,
                  color: Color(0xff7A4012),
                  onTap: () => Get.to(() => TimeTableTeacherPage()),
                ),
                CustomCard(
                  image: "assets/HomeTeacher/Students-cuate.png",
                  text: "30".tr,
                  //  text: "search for student",
                  color: Color(0xff7A4012),
                  onTap: () => Get.to(() => StudentsPage()),
                ),
                CustomCard(
                  image: "assets/HomeTeacher/Upload-bro.png",
                  text: "31".tr,
                  // text: "upload",
                  color: Color(0xff7A4012),
                  onTap: () => Get.to(() => UploadHomeworkPage()),
                ),
                CustomCard(
                  image: "assets/HomeTeacher/Chat bot-amico.png",
                  text: "22".tr,
                  color: Color(0xff7A4012),
                  onTap: () => Get.to(() => AiScreen(
                        mainColor: Color(0xffE4DDC1),
                      )),
                ),
                CustomCard(
                  image: "assets/HomeTeacher/Search-amico.png",
                  text: "32".tr,
                  color: Color(0xff7A4012),
                  onTap: () => Get.to(() => StudentSearchPage()),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.1,
                crossAxisSpacing: 6,
                mainAxisSpacing: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
