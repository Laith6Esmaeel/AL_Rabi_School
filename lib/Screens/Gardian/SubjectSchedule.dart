import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Services/Get_Schedule.dart';
import 'package:shcool/models/DaySchedule.dart';

class TimeTablePage extends StatelessWidget {
  final List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  String formatTime(String time24) {
    try {
      final parts = time24.split(":");
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      final period = hour < 12 ? 'am' : 'pm';
      final formattedHour = hour % 12 == 0 ? 12 : hour % 12;
      final formattedMinute = minute.toString().padLeft(2, '0');
      return "$formattedHour:$formattedMinute $period";
    } catch (_) {
      return time24;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DaySchedule>>(
      future: GetSchedule().getWeeklySchedule(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Scaffold(body: Center(child: Text('68'.tr)));
        }

        final scheduleMap = {
          for (var daySchedule in snapshot.data!)
            daySchedule.day: daySchedule.lessons
        };

        return DefaultTabController(
          length: days.length,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff8CB0FF),
              title: Column(
                children: [
                  SizedBox(height: 8),
                  TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    tabs: days
                        .map((day) => Tab(text: day.substring(0, 3)))
                        .toList(),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: days.map((day) {
                final lessons = scheduleMap[day] ?? [];
                return ListView.builder(
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = lessons[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child:
                          TimeTableCard(lesson: lesson, formatTime: formatTime),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class TimeTableCard extends StatelessWidget {
  final Lesson lesson;
  final String Function(String) formatTime;

  const TimeTableCard(
      {Key? key, required this.lesson, required this.formatTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getCardColor(String subject) {
      if (subject.contains('English') || subject.contains('لغة اجنبية'))
        return Colors.greenAccent.shade100;
      if (subject.contains('عربي') || subject.contains('تاريخ'))
        return Colors.blue.shade100;
      if (subject.contains('Physics') || subject.contains('معلوماتية'))
        return Colors.red.shade100;
      if (subject.contains('Lunch') || subject.contains('موسيقا'))
        return Colors.purple.shade100;
      if (subject.contains('Free') || subject.contains('قومية'))
        return Colors.grey.shade200;
      return Colors.grey.shade100;
    }

    final isFreeOrBreak = lesson.subject.contains('Lunch') ||
        lesson.subject.contains('Free') ||
        lesson.subject.contains('استراحة') ||
        lesson.subject.contains('فراغ');

    return Container(
      decoration: BoxDecoration(
        color: getCardColor(lesson.subject),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Text(
          formatTime(lesson.startTime),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        title: Text(lesson.subject),
        subtitle: isFreeOrBreak
            ? null
            : Row(
                children: [
                  Text(lesson.teacher),
                  SizedBox(width: 8),
                  Text(
                      '${formatTime(lesson.startTime)} - ${formatTime(lesson.endTime)}'),
                ],
              ),
      ),
    );
  }
}
