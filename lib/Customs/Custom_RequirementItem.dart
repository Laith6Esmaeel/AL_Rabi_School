import 'package:flutter/material.dart';

class RequirementItem extends StatelessWidget {
  final String title;
  final String date;
  final double progress;

  RequirementItem(this.title, this.date, this.progress);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 4),
          Text(date, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress / 100,
              color: Color(0xff8CB0FF),
              backgroundColor: Colors.grey[200],
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
