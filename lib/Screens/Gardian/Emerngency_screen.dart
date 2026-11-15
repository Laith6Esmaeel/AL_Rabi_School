import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  final String phoneNumber = "+963932887582";

  Future<void> _callEmergency() async {
    await FlutterPhoneDirectCaller.callNumber("+963932887582");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
               Text(
                '126'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
               Text(
                '127'.tr,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),

              GestureDetector(
                onLongPress: () {
                  _callEmergency();
                },
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff8CB0FF),
                        Color(0xffF2B6CC),
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff8CB0FF),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.sensors,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
              ),

              const SizedBox(height: 40),
              const Text(
                "Not sure what to do?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Pick the subject to chat",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildOptionCard(
                      title: "I have\nan accident",
                      icon: Icons.car_crash_outlined,
                      onTap: () {},
                    ),
                    buildOptionCard(
                      title: "I have\nan injury",
                      icon: Icons.health_and_safety_outlined,
                      onTap: () {},
                    ),
                    buildOptionCard(
                      title: "I'm feeling\nunwell",
                      icon: Icons.mood_bad_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Color(0xff8CB0FF), size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            const Icon(Icons.arrow_forward, size: 18, color: Color(0xff8CB0FF)),
          ],
        ),
      ),
    );
  }
}
