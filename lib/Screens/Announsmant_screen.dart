
import 'package:flutter/material.dart';
import 'package:shcool/Customs/Custom_Announcement.dart';
import 'package:shcool/Services/Get_Announcement.dart';
import 'package:shcool/models/Announcement_model.dart';

class AnnounsmantScreen extends StatelessWidget {
  const AnnounsmantScreen({super.key,required this.gradientColors});
  final List<Color> gradientColors; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Announcement>>(
        future: GetAnnouncement().getAnnouncement(), 
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Announcement> announcements = snapshot.data!;
            return CustomAnnouncement(
              announcements: announcements, gradientColors: gradientColors, 
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
