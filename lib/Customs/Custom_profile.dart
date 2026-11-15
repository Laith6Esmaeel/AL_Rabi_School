import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  CustomProfile(
      {super.key, required this.des, required this.about, required this.icon});

  String des;
  String about;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 20),
      child: Expanded(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Icon(
                icon,
                size: 30,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      des,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3, left: 0),
                    child: Text(
                      about,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
