// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shcool/Controllers/Forget-Controller.dart';
// import 'package:shcool/Customs/Custom_buildStatCard.dart';

// class Attendanet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xffF2B6CC), Color(0xff8CB0FF)],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Container(
//               width: 600,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.9),
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Text(
//                     "Absence",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 20),

               
//                   const Text("Student's name ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                   const SizedBox(height: 8),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: " Write the student's name here",
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Color(0xff8CB0FF), width: 2),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   Row(
//                     children: [
                      
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text("grade", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                             const SizedBox(height: 8),
//                             DropdownButtonFormField<String>(
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                                 contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                               ),
//                               items: const [
//                                 DropdownMenuItem(value: "First", child: Text("The First")),
//                                 DropdownMenuItem(value: "Second", child: Text("The Second")),
//                                 DropdownMenuItem(value: "Third", child: Text("The Third")),
//                                 DropdownMenuItem(value: "Forth", child: Text("The Forth")),
//                                 DropdownMenuItem(value: "Fifth", child: Text("The Fifth")),
//                                 DropdownMenuItem(value: "Sixth", child: Text("Sixth")),
//                               ],
//                               onChanged: (val) {},
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 12),

//                      
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text("section", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                             const SizedBox(height: 8),
//                             DropdownButtonFormField<String>(
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                                 contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                               ),
//                               items: const [
//                                 DropdownMenuItem(value: "أ", child: Text("أ")),
//                                 DropdownMenuItem(value: "ب", child: Text("ب")),
//                                 DropdownMenuItem(value: "ج", child: Text("ج")),
//                                 DropdownMenuItem(value: "د", child: Text("د")),
//                               ],
//                               onChanged: (val) {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

                  
//                   const Text("Date of absence ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//                   const SizedBox(height: 8),
//                   TextField(
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       hintText: "select date ",
//                       suffixIcon: const Icon(Icons.calendar_today, size: 20),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: Color(0xff8CB0FF), width: 2),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                  
//                   Row(
//                     children: [
//                       Checkbox(value: false, onChanged: (val) {}),
//                       const Text("IS absence justified "),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                         ),
//                         onPressed: () {},
//                         child: const Text("إلغاء"),
//                       ),
//                       Row(
//                         children: [
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xffF2B6CC),
//                               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                             ),
//                             onPressed: () {},
//                             child: const Text("حفظ", style: TextStyle(color: Colors.black)),
//                           ),
//                           const SizedBox(width: 12),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xff8CB0FF),
//                               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                             ),
//                             onPressed: () {},
//                             child: const Text("حفظ وإضافة", style: TextStyle(color: Colors.white)),
//                           ),
//                         ],
//                       ),
//                     ],   
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//     //  Scaffold(
//       // backgroundColor: Colors.white,
//       // body: SafeArea(
//       //   child: Padding(
//       //     padding: const EdgeInsets.all(16.0),
//       //     child: Column(
//       //       crossAxisAlignment: CrossAxisAlignment.start,
//       //       children: [
//       //         // --------- Header ----------
//       //         Row(
//       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //           children: [
//       //             Column(
//       //               crossAxisAlignment: CrossAxisAlignment.start,
//       //               children: [
//       //                 Text(
//       //                   "Hi Ahmed",
//       //                   style: TextStyle(
//       //                     fontSize: 24,
//       //                     fontWeight: FontWeight.bold,
//       //                     color: Colors.black,
//       //                   ),
//       //                 ),
//       //               ],
//       //             ),
//       //           ],
//       //         ),

//       //         SizedBox(height: 20),

//       //         Text(
//       //           '39'.tr,
//       //           style: TextStyle(
//       //               color: Colors.black,
//       //               fontSize: 20,
//       //               fontWeight: FontWeight.bold),
//       //         ),
//       //         SizedBox(height: 12),
//       //         GridView.count(
//       //           crossAxisCount: 2,
//       //           shrinkWrap: true,
//       //           childAspectRatio: 1.5,
//       //           mainAxisSpacing: 10,
//       //           crossAxisSpacing: 10,
//       //           physics: NeverScrollableScrollPhysics(),
//       //           children: [
//       //             CustomBuildstatcard(title: '40'.tr, count: '22', color:Colors.black),
                 
//       //             CustomBuildstatcard(title: 'Absent', count: '5', color: Colors.black),
//       //             CustomBuildstatcard(title: 'Late', count: '3',color: Colors.black
//       //             ),
//       //             CustomBuildstatcard(title: 'Excused', count: '2', color: Colors.black),
//       //           ],
//       //         ),

//       //         SizedBox(height: 20),
//       //       ],
//       //     ),
//       //   ),
//       // ),
    
//   }
// }
