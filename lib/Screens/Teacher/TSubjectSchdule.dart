import 'package:flutter/material.dart';
import 'package:shcool/Services/Get_Schedule.dart';
import 'package:shcool/models/TeacherSchedule.dart';

class TimeTableTeacherPage extends StatelessWidget {
  final List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TimetableTeacherDay>>(
      future: GetSchedule().getWeeklyTeacherSchedule(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Scaffold(body: Center(child: Text('no data to show')));
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
                if (lessons.isEmpty) {
                  return Center(child: Text("No lessons for $day"));
                }
                return ListView.builder(
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = lessons[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: TimeTableCard(
                        lesson: lesson,
                        order: index + 1, // ترتيب الحصة
                      ),
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
  final int order;

  const TimeTableCard({Key? key, required this.lesson, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getCardColor(String subject) {
      if (subject.contains('English') || subject.contains('انكليزي'))
        return Color(0xff7A4012);
      if (subject.contains('Maths') || subject.contains('رياضيات'))
        return Color(0xffE4DDC1);
      if (subject.contains('Physics') || subject.contains('جغرافيا'))
        return Color(0xff7A4012);
      if (subject.contains('عربي')) return Color(0xffE4DDC1);
      if (subject.contains('قومية')) return Color(0xff7A4012);
      return Color(0xff7A4012);
    }

    return Container(
      decoration: BoxDecoration(
        color: getCardColor(lesson.subject),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(order.toString()),
        ),
        title: Text(lesson.subject),
        subtitle: Row(
          children: [
            Text(lesson.grade ?? "Grade ?"),
            SizedBox(width: 8),
            Text(lesson.section ?? "Section ?"),
          ],
        ),
      ),
    );
  }
}
