import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Customs/Custom_Exam.dart';
import 'package:shcool/Services/Get_Schedule.dart';
import 'package:shcool/models/Exam_model.dart';

class Examschedule extends StatelessWidget {
  const Examschedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: 300,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: Image.asset(
                    "assets/home/Exams-bro.png",
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
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 300, bottom: 20),
            child: Text(
              '60'.tr,
              style: TextStyle(
                fontSize: 25,
                color: Colors.greenAccent.shade100,
                fontFamily: 'Pacifico',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FutureBuilder<List<ExamSchedule>>(
            future: GetSchedule().getExamSchedule(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ExamSchedule> prof = snapshot.data!;
                return CustomExam(
                  examSchedule: prof,
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
