
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shcool/Services/Get_Mark.dart';
import 'package:shcool/models/StudentsMark_model.dart';

class StudentMarks extends StatelessWidget {
  const StudentMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<StudenttMarks>>(
        future: GetMark().getMarks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final student = snapshot.data!.first;
            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff8CB0FF),
                        Color(0xffF2B6CC),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 100, bottom: 580, right: 100),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade50,
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 50)
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              student.averageScore.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '62'.tr,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ListView(
                        children: [
                           Center(
                            child: Text(
                              '64'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Table(
                            border: TableBorder.all(
                              color: Colors.black26,
                              width: 2,
                            ),
                            children: [
                               TableRow(
                                decoration:
                                    BoxDecoration(color: Color(0xFFEFEFEF)),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('65'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('66'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('67'.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              ...student.marks.map((mark) {
                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(mark.subjectName,
                                          textAlign: TextAlign.center),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(mark.maxScore.toString(),
                                          textAlign: TextAlign.center),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(mark.score.toString(),
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text("No marks available"));
          }
        },
      ),
    );
  }
}
