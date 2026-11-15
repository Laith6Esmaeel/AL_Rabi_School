import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Screens/Login_Screen.dart';
import 'package:shcool/onboard/First_Screen.dart';
import 'package:shcool/onboard/Second_Screen.dart';
import 'package:shcool/onboard/Third_Screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: _controller,
                children: [
                  FirstScreen(),
                  SecondScreen(),
                  ThirdScreen(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Customindicator(active: index == 0),
                SizedBox(width: 5),
                Customindicator(active: index == 1),
                SizedBox(width: 5),
                Customindicator(active: index == 2),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Text(
                      "12".tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (index == 2) {
                        Get.to(() => LoginScreen());
                      } else {
                        _controller.animateToPage(index + 1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.linear);
                      }
                    },
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Text(
                        index == 2 ? "11".tr : "13".tr,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Customindicator extends StatelessWidget {
  final bool active;
  const Customindicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? Color(0x4738c) : Colors.grey,
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}
