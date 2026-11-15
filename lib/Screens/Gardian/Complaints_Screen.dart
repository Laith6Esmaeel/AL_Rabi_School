import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/Add_complaints_Controller.dart';
import 'package:shcool/Customs/Custom_Complaints.dart';
import 'package:shcool/Services/Get_Complaints.dart';
import 'package:shcool/models/Complaint%20_model.dart';

class ComplaintsScreen extends StatelessWidget {
  final List<Color> gradientColors;
  final Color textFieldColor;

  const ComplaintsScreen({
    super.key,
    required this.gradientColors,
    required this.textFieldColor,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: height * 0.08,
                left: width * 0.05,
                right: width * 0.05,
                bottom: height * 0.02),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradientColors),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '43'.tr,
                  style: TextStyle(
                    fontSize: height * 0.045,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  '58'.tr,
                  style: TextStyle(
                    fontSize: height * 0.02,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.03),
                TextFormField(
                  controller: AddComplaintsController.ComplaintsController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: height * 0.015),
                    filled: true,
                    fillColor: textFieldColor,
                    hintText: '59'.tr,
                    prefixIcon: GestureDetector(
                      onTap: () {
                        AddComplaintsController.AddComplaints();
                      },
                      child:
                          Icon(Icons.add_circle_outlined, size: height * 0.05),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.045),
                child: FutureBuilder<List<Complaint>>(
                  future: GetComplaints().getComplaints(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("فشل في تحميل الشكاوى: ${snapshot.error}"),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("لا توجد شكاوى لعرضها"));
                    } else {
                      final complaints = snapshot.data!;
                      return ListView.builder(
                        itemCount: complaints.length,
                        itemBuilder: (context, index) {
                          final complaint = complaints[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomComplaints(
                              gradientColors: gradientColors,
                              complaint: complaint,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
