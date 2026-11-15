// import 'package:flutter/material.dart';
// import 'package:shcool/Customs/Custom_Button.dart';
// import 'package:shcool/models/Announcement_model.dart';

// class CustomAnnouncement extends StatelessWidget {
//    CustomAnnouncement({super.key , required this.announcements});
//   List<Announcement> announcements;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 1000,
//       width: 400,
//       child: Stack(
//         children: [
//           Image.asset(
//             "assets/HomeTeacher/photo_2025-08-07_21-28-33.jpg",
//             fit: BoxFit.fill,
//             height: 1000,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 30, top: 70),
//             child: Text(
//           announcements[0].name,
//             //  "the first annousment",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Pacifico',
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 90, top: 700),
//             child: Custum_Button(
//               colors: [
//                 Color(0xff8CB0FF),
//                 Color(0xffF2B6CC),
//               ],
//               text: "Details",
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return Container(
//                       padding: EdgeInsets.all(16),
//                       height: 200,
//                       width: 400,
//                       child: Column(
//                         children: [
//                           Text( announcements[0].description,
//                            // 'the details for our announsment ',
//                               style: TextStyle(fontSize: 20)),
//                           SizedBox(height: 10),
//                           ElevatedButton(
//                             child: Text('colse'),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Controllers/Forget-Controller.dart';
import 'package:shcool/Customs/Custom_Button.dart';
import 'package:shcool/models/Announcement_model.dart';

class CustomAnnouncement extends StatelessWidget {
  final List<Announcement> announcements;
  final List<Color> gradientColors;

  const CustomAnnouncement({super.key, required this.announcements,required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      width: 400,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final ann = announcements[index];
          return Stack(
            children: [
              Image.asset(
                "assets/HomeTeacher/photo_2025-08-07_21-28-33.jpg",
                fit: BoxFit.fill,
                height: 1000,
                width: 400,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 70),
                child: Text(
                  ann.name, 
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, top: 700),
                child: Custum_Button(
                  colors:  gradientColors,
                  text: '36'.tr,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          height: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ann.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                ann.description ?? '37'.tr,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              Center(
                                child: ElevatedButton(
                                  child:  Text('38'.tr),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
