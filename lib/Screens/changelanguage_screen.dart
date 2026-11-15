import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Screens/Gardian/G_HomePage.dart';

class ChangeLanguage extends StatelessWidget {
  ChangeLanguage({super.key});

final RxString selectedLang = Get.locale?.languageCode.obs ?? 'en'.obs;



  @override
  Widget build(BuildContext context) {
    double widthscreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Language"),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? Colors.black : Color(0xff8CB0FF),
        elevation: 0,
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: widthscreen * 0.05, bottom: 1),
              child: TextButton(
                onPressed: () {
                   
                  Get.updateLocale(Locale(selectedLang.value));
                   Get.offAll(() => GHomepage()); 
                },
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8CB0FF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(() => Card(
            child: CheckboxListTile(
              title: const Text("English"),
              activeColor: Color(0xff8CB0FF),
              value: selectedLang.value == 'en',
              onChanged: (bool? value) {
                if (value == true) {
                    // _changeLang('en');
                   selectedLang.value = 'en';
                   Get.updateLocale(const Locale('en'));
                      Get.offAll(() => GHomepage());
                  
                }
              },
            ),
          )),
          Obx(() => Card(
            child: CheckboxListTile(
              title: const Text("Arabic"),
              activeColor: Color(0xff8CB0FF),
              value: selectedLang.value == 'ar',
              onChanged: (bool? value) {
                if (value == true) {
                  selectedLang.value = 'ar';
                   Get.updateLocale(const Locale('ar'));
                     Get.offAll(() => GHomepage());
                
                }
              },
            ),
          )),
        ],
      ),
    );
  }
}
