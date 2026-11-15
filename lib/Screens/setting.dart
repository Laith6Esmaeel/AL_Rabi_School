import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/loout_Comtroller.dart';
import 'package:shcool/Customs/customrowS.dart';
import 'package:shcool/Customs/imageS.dart';
import 'package:shcool/Customs/textS.dart';
import 'package:shcool/Screens/Profile.dart';
import 'package:shcool/Screens/changelanguage_screen.dart';

import '../Controllers/themecontroller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeControllerImp themeController = Get.find();
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('98'.tr),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? Colors.black : Color(0xff8CB0FF),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomStackImage(image: "assets/alrabee.jpg"),
            ],
          ),
          sectionTitle('99'.tr),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CustomRow(
                    text: '98'.tr,
                    icon: Icons.person,
                    onPressed: () {
                      Get.to(() => ProfileScreen());
                    },
                    color: Color(0xff8CB0FF),
                    endpadding: widthscreen * 0.37,
                  ),
                  CustomRow(
                    text: '100'.tr,
                    icon: Icons.language,
                    onPressed: () {
                      Get.to(() => ChangeLanguage());
                    },
                    color: Color(0xff8CB0FF),
                    endpadding: widthscreen * 0.37,
                  ),
                  CustomRow(
                    text: '101'.tr,
                    icon: Icons.logout,
                    onPressed: () {
                      Get.defaultDialog(
                          titleStyle: const TextStyle(color: Colors.red),
                          title: '102'.tr,
                          middleText: '103'.tr,
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    LogOutControllerController().LogOut();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff8CB0FF),
                                  ),
                                  child: Text(
                                    '104'.tr,
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff8CB0FF),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  '105'.tr,
                                  style: TextStyle(color: Colors.red),
                                )),
                          ]);
                    },
                    color: Color(0xff8CB0FF),
                    endpadding: widthscreen * 0.37,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: CustomText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        toppadding: 0,
        bottompadding: 0,
        startpadding: 0,
        endpadding: 0,
      ),
    );
  }
}
