import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Customs/Custom_Button.dart';
import 'package:shcool/Screens/Teacher/RebortsTeacher_Screen.dart';
import 'package:shcool/Screens/Teacher/SubmitNote_Screen.dart';
import 'package:shcool/Services/Get_Students.dart';
import 'package:shcool/models/students_model.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});
  String _fixImageUrl(String originalUrl) {
    if (originalUrl.contains('127.0.0.1')) {
      return originalUrl.replaceAll(
          'http://127.0.0.1:8000', 'http://10.156.137.170:8000');
    } else if (originalUrl.contains('10.156.137.170')) {
      return originalUrl;
    } else {
      return originalUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('69'.tr),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Students>>(
        future: GetStudents().getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text("فشل في تحميل الطلاب: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("لا يوجد طلاب"));
          }

          final students = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: const Color(0xffE4DDC1),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage:
                            student.image != null && student.image!.isNotEmpty
                                ? NetworkImage(_fixImageUrl(student.image!))
                                : const AssetImage("assets/alrabee.jpg")
                                    as ImageProvider,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              student.studentName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${student.grade} - ${student.section}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.book,
                                    size: 16, color: Color(0xff7A4012)),
                                const SizedBox(width: 4),
                                const Icon(Icons.star,
                                    size: 16, color: Colors.orange),
                                const SizedBox(width: 4),
                                Text("GPA: ${student.averageScore}"),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          padding: const EdgeInsets.all(16),
                                          height: 250,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Custum_Button(
                                                    colors: [
                                                      Color(0xff7A4012),
                                                      Color(0xffE4DDC1)
                                                    ],
                                                    text: '109'.tr,
                                                    onPressed: () => Get.to(
                                                        () => SubmitnoteScreen(
                                                              id: student.id
                                                                  .toInt(),
                                                            )),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Custum_Button(
                                                    colors: [
                                                      Color(0xff7A4012),
                                                      Color(0xffE4DDC1)
                                                    ],
                                                    text: '110'.tr,
                                                    onPressed: () => Get.to(() =>
                                                        RebortsteacherScreen(
                                                            id: student.id
                                                                .toInt())),
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Center(
                                                child: ElevatedButton(
                                                  child: Text('38'.tr),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: const Icon(Icons.arrow_outward_rounded,
                                      size: 30, color: Colors.orange),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
