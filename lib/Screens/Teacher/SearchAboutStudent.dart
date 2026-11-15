import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shcool/Controllers/Search_Student_Controller.dart';
import 'package:shcool/Services/Get_Students.dart';
import 'package:shcool/models/students_model.dart';
import 'package:shcool/models/Sesrch_model.dart';

class StudentSearchPage extends StatefulWidget {
  const StudentSearchPage({super.key});

  @override
  State<StudentSearchPage> createState() => _StudentSearchPageState();
}

class _StudentSearchPageState extends State<StudentSearchPage> {
  final Color primaryColor = const Color(0xff7A4012);
  final Color backgroundColor = const Color(0xffFFFFFF);

  Future<List<SearchStudent>>? searchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xffE4DDC1),
        title: Text(
          '78'.tr,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: SearchStudentController.nameController,
              decoration: InputDecoration(
                hintText: '79'.tr,
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                prefixIcon: const Icon(Icons.search, color: Color(0xffE4DDC1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    searchResult = SearchStudentController.searchStudent();
                  });
                } else {
                  setState(() {
                    searchResult = null;
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            if (searchResult != null)
              Expanded(
                child: FutureBuilder<List<SearchStudent>>(
                  future: searchResult,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.brown,
                      ));
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('Error: ${snapshot.error.toString()}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('لا يوجد نتائج'));
                    } else {
                      final students = snapshot.data!;
                      return ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                student.studentName ?? "",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                  '${student.grade ?? ""} - ${student.section ?? ""}'),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            else
              Expanded(
                child: FutureBuilder<List<Students>>(
                  future: GetStudents().getStudents(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.brown,
                      ));
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('Error: ${snapshot.error.toString()}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('لا يوجد طلاب'));
                    } else {
                      final students = snapshot.data!;
                      return ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                student.studentName ?? "",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                  '${student.grade ?? ""} - ${student.section ?? ""}'),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
