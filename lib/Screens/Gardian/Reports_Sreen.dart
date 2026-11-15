import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Customs/Custom_Reports.dart';
import 'package:shcool/Customs/Custom_RequirementItem.dart';
import 'package:shcool/Customs/Custom_stats.dart';
import 'package:shcool/Services/Get_Reports.dart';
import 'package:shcool/models/Reports_model.dart';

class ReportsSreen extends StatelessWidget {
  const ReportsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FutureBuilder<StudentEvaluation>(
        future: GetReports().getReport(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text("فشل في تحميل التقرير: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("لا يوجد تقرير متاح"));
          } else {
            final report = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomReports(),
                  const SizedBox(height: 20),

                  CustomStats(studentEvaluation: report),

                  const SizedBox(height: 20),

                  Expanded(
                    child: ListView(
                      children: [
                        RequirementItem(
                          '61'.tr,
                          "الفصل الأول",
                          report.semester1.toDouble(),
                        ),
                        RequirementItem(
                          '63'.tr,
                          "الفصل الثاني",
                          report.semester2.toDouble(),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Color(0xffF2B6CC), Color(0xff8CB0FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              report.description ?? "لا توجد ملاحظات",
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
