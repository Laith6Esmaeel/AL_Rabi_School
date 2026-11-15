import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/models/Reports_model.dart';

class CustomStats extends StatelessWidget {
  CustomStats({super.key, required this.studentEvaluation});
  StudentEvaluation studentEvaluation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStat(studentEvaluation.behavior.toString() + "%", '51'.tr),
          _buildStat(studentEvaluation.interaction.toString() + "%", '52'.tr),
          _buildStat(studentEvaluation.level.toString() + "%", '53'.tr),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
