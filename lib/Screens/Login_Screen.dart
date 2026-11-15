// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shcool/Controllers/Login-controller.dart';
// import 'package:shcool/Customs/Custom_Button.dart';
// import 'package:shcool/Screens/Forget_password.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: SafeArea(
//         child: ListView(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 40),
//                 child: Container(
//                   width: 150,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     color: Color(0xffF2B6CC),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: Color(0xff8CB0FF),
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.only(left: 120),
//               child: Text(
//                 '7'.tr,
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     foreground: Paint()
//                       ..shader = LinearGradient(colors: <Color>[
//                         Color(0xff8CB0FF),
//                         Color(0xffF2B6CC),
//                       ]).createShader(Rect.fromLTWH(0, 100, 270, 70))),
//               ),
//             ),
//             SizedBox(height: 10),
//             CircleAvatar(
//                 backgroundColor: Colors.black,
//                 radius: 120,
//                 child: CircleAvatar(
//                   radius: 140,
//                   backgroundImage: AssetImage('assets/alrabee.jpg'),
//                 )),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: TextField(
//                 controller: LoginController.emailconroller,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.mail),
//                   hintText: '8'.tr,
//                   filled: true,
//                   iconColor: Theme.of(context).scaffoldBackgroundColor,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: TextField(
//                 controller: LoginController.passwordcontroller,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock),
//                   hintText: '9'.tr,
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             GestureDetector(
//                 onTap: () => Get.to(() => Forget_password()),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 120),
//                   child: Text('10'.tr),
//                 )),
//             SizedBox(height: 25),
//             Padding(
//               padding: const EdgeInsets.only(left: 75, right: 75),
//               child: Custum_Button(
//                 colors: [
//                   Color(0xff8CB0FF),
//                   Color(0xffF2B6CC),
//                 ],
//                 text: "11".tr,
//                 onPressed: () {
//                   LoginController.loginWithPhone();

//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/Customs/Custom_Button.dart';
import 'package:shcool/Screens/Forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool secourText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffF2B6CC),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xff8CB0FF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Text(
                '7'.tr,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(colors: <Color>[
                        Color(0xff8CB0FF),
                        Color(0xffF2B6CC),
                      ]).createShader(Rect.fromLTWH(0, 100, 270, 70))),
              ),
            ),
            SizedBox(height: 10),
            CircleAvatar(
                backgroundColor: Colors.black,
                radius: 120,
                child: CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage('assets/alrabee.jpg'),
                )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: LoginController.emailconroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  hintText: '8'.tr,
                  filled: true,
                  iconColor: Theme.of(context).scaffoldBackgroundColor,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: LoginController.passwordcontroller,
                obscureText: secourText,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          secourText = !secourText;
                        });
                      },
                      icon: Icon(secourText
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  hintText: '9'.tr,
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () => Get.to(() => Forget_password()),
                child: Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: Text('10'.tr),
                )),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 75, right: 75),
              child: Custum_Button(
                colors: [
                  Color(0xff8CB0FF),
                  Color(0xffF2B6CC),
                ],
                text: "11".tr,
                onPressed: () {
                  LoginController.loginWithPhone();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
