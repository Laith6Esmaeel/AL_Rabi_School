import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Customs/Custom_profile.dart';
import 'package:shcool/models/profile_model.dart';

class CustomShowprofile extends StatelessWidget {
  CustomShowprofile({super.key, required this.profs});
  ProfileModel profs;
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 40),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 110,
            child: CircleAvatar(
              radius: 110,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: profs.image != null && profs.image!.isNotEmpty
                  ? NetworkImage(
                      _fixImageUrl(profs.image!))
                  : const AssetImage("assets/alrabee.jpg")
                      as ImageProvider, 
            ),
          ),
        ),
        CustomProfile(des: '46'.tr, about: profs.name!, icon: Icons.person),
        CustomProfile(des: '47'.tr, about: profs.email!, icon: Icons.email),
        CustomProfile(
            des: '48'.tr, about: profs.phoneNumber!, icon: Icons.phone),
        CustomProfile(des: '49'.tr, about: profs.gender!, icon: Icons.person),
        CustomProfile(
            des: '50'.tr, about: profs.role!, icon: Icons.reorder_outlined),
      ],
    );
  }
}
