import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStackImage extends StatelessWidget {
  final String image;
  const CustomStackImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: heightscreen * 0.03,
          bottom: heightscreen * 0.01,
          start: widthscreen * 0.3),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: widthscreen * 0.4,
            height: heightscreen * 0.19,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage(image),
                  fit: BoxFit.fill),
              borderRadius: const BorderRadius.all(
                Radius.circular(120),
              ),
            ),
          ),
          InkWell(
            child: CircleAvatar(
              backgroundColor: Color(0xff8CB0FF),
              child: Icon(
                Icons.camera_alt_outlined,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
