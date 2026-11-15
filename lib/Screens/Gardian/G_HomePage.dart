import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shcool/Customs/Custom_Gcard.dart';
import 'package:shcool/Customs/Custom_Homework.dart';
import 'package:shcool/Screens/AI_screen.dart';
import 'package:shcool/Screens/Gardian/Complaints_Screen.dart';
import 'package:shcool/Screens/Gardian/Emerngency_screen.dart';
import 'package:shcool/Screens/Gardian/ExamSchedule.dart';
import 'package:shcool/Screens/Gardian/HomeworkScreen.dart';
import 'package:shcool/Screens/Gardian/Library_Screen.dart';
import 'package:shcool/Screens/Gardian/Note_Screen.dart';
import 'package:shcool/Screens/Gardian/Reports_Sreen.dart';
import 'package:shcool/Screens/Gardian/SubjectSchedule.dart';

class GHomepage extends StatelessWidget {
  const GHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8CB0FF),
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
                    "assets/OnBoard/Learning (5).gif",
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
                        color: Color(0xffF2B6CC),
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
                      color: Color(0xff8CB0FF),
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
                color: Color(0xffF2B6CC),
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: CustomHomework(),
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
                color: Color(0xffF2B6CC),
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          Container(
            height: 400,
            child: GridView(
              children: [
                CustomCard(
                  image: "assets/home/Schedule-rafiki.png",
                  text: "17".tr,
                  color: Color(0xff8CB0FF),
                  onTap: () => Get.to(() => TimeTablePage()),
                ),
                CustomCard(
                  image: "assets/home/Timeline-bro (1).png",
                  text: "18".tr,
                  color: Color(0xffF2B6CC),
                  onTap: () => Get.to(() => Examschedule()),
                ),
                CustomCard(
                  image: "assets/home/Library-rafiki.png",
                  text: "19".tr,
                  color: Color(0xff8CB0FF),
                  onTap: () => Get.to(() => PdfLibraryScreen()),
                ),
                CustomCard(
                  image: "assets/home/Exams-bro.png",
                  text: "20".tr,
                  color: Color(0xffF2B6CC),
                  onTap: () => Get.to(() => Homeworkscreen()),
                ),
                CustomCard(
                  image: "assets/home/Notebook-rafiki.png",
                  text: "21".tr,
                  color: Color(0xff8CB0FF),
                  onTap: () => Get.to(() => ComplaintsScreen(
                        gradientColors: [
                          Color(0xffF2B6CC),
                          Color(0xff8CB0FF),
                        ],
                        textFieldColor: Color(0xffF2B6CC),
                      )),
                ),
                CustomCard(
                  image: "assets/home/Chat bot-bro.png",
                  text: "22".tr,
                  color: Color(0xffF2B6CC),
                  onTap: () => Get.to(() => AiScreen(
                        mainColor: Color(0xff8CB0FF),
                      )),
                ),
                CustomCard(
                  image: "assets/home/Emergency call-amico.png",
                  text: "23".tr,
                  color: Color(0xff8CB0FF),
                  onTap: () => Get.to(() => EmergencyScreen()),
                ),
                CustomCard(
                  image: "assets/home/Report-amico.png",
                  text: "24".tr,
                  color: Color(0xffF2B6CC),
                  onTap: () => Get.to(() => ReportsSreen()),
                ),
                CustomCard(
                  image: "assets/home/Mobile Marketing-rafiki.png",
                  text: "108".tr,
                  color: Color(0xff8CB0FF),
                  onTap: () => Get.to(() => NotesScreen()),
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
