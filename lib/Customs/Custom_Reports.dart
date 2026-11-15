import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomReports extends StatelessWidget {
  const CustomReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Color(0xffF2B6CC), Color(0xff8CB0FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reports",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 3.5),
                      FlSpot(2, 3.4),
                      FlSpot(3, 4),
                      FlSpot(4, 5),
                    ],
                    isCurved: true,
                    color: Colors.black,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
