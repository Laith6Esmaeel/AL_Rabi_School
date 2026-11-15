import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/Forget-Controller.dart';
import 'package:shcool/models/Complaint%20_model.dart';

class CustomComplaints extends StatelessWidget {
  final List<Color> gradientColors;
  Complaint complaint;
  CustomComplaints(
      {super.key, required this.gradientColors, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '41'.tr,
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(
                width: 10,
              ),
              Text("1", style: TextStyle(color: Colors.black87)),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: gradientColors.first.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  complaint.status,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                '43'.tr,
                style: TextStyle(color: Colors.black87),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(complaint.complaint,
                    style: TextStyle(color: Colors.black87)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
