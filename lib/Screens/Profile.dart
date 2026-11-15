import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Customs/Custom_ShowProfile.dart';
import 'package:shcool/Services/Get_profile.dart';
import 'package:shcool/models/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8CB0FF),
        // Color(0xff7082BB),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text('98'.tr),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: FutureBuilder(
                future: profile().profille(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ProfileModel prof = snapshot.data!;
                    return CustomShowprofile(
                      profs: prof,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
