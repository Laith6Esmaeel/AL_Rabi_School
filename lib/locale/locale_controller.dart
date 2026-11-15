import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyLocalController extends GetxController {
  
// static Future<SharedPreferences> sharepref =
//      SharedPreferences.  getInstance() ;
// Locale intialLang =sharepref. getString("lang") =="en"?Locale("en"):Locale("ar");
void changeLang(String codeLang){
  Locale locale =Locale(codeLang);
  // sharepref.setString("lang",codeLang);
  Get.updateLocale(locale);
}

}