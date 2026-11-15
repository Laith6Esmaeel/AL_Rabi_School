import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Services/Get_Absence.dart';
import 'package:shcool/models/StudentAbsence%20_model.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffF2B6CC), Color(0xff8CB0FF)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 700,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: FutureBuilder<List<StudentAbsence>>(
                future: GetAbsence().getAbsences(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('لا يوجد بيانات لعرضها'));
                  }

                  final absences = snapshot.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '54'.tr, 
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DataTable(
                        border: TableBorder.all(color: Colors.grey.shade300),
                        columns: [
                          DataColumn(
                            label: Text('55'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                          DataColumn(
                            label: Text('56'.tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                        rows: absences.map((absence) {
                          return DataRow(
                            cells: [
                              DataCell(Text(absence.date)),
                              DataCell(Text(absence.excuse == "justified"
                                  ? "نعم"
                                  : "لا")),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff8CB0FF),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: Text('57'.tr,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
