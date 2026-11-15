import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/Forget-Controller.dart';
import 'package:shcool/models/Exam_model.dart';
class CustomExam extends StatelessWidget {
  final List<ExamSchedule> examSchedule;

  CustomExam({Key? key, required this.examSchedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 365, left: 10),
      child: Container(
        width: 390,
        height: 1000,
        padding: EdgeInsets.only(left: 0, right: 10),
        child: ListView.builder(
          itemCount: examSchedule.length,
          itemBuilder: (context, index) {
            final daySchedule = examSchedule[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 390,
                height: 200,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Color(0xff8CB0FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            daySchedule.exams[0].subjectName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              daySchedule.examDate,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${daySchedule.exams[0].examTime} AM',
                                  style: TextStyle(fontSize: 16)),
                              Text('44'.tr,
                                  style: TextStyle(color: Colors.grey[700])),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              daySchedule.day,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("10:00 AM",
                                    style: TextStyle(fontSize: 16)),
                                Text('45'.tr,
                                    style: TextStyle(color: Colors.grey[700])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
