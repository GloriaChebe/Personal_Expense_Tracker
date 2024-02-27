import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomBarChart extends StatelessWidget {
  final BarChartData barChartData;

  const CustomBarChart(this.barChartData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AspectRatio(
          aspectRatio: 1,
          child: BarChart(
            barChartData,
          ),
        ),
      ),
    );
  }
}

class MyBarChartData {
  static BarChartData getChartData() {
    return BarChartData(
      
      borderData: FlBorderData(
        border: Border(
          top: BorderSide.none,
          right: BorderSide.none,
          left: BorderSide(width: 1),
          bottom: BorderSide(width: 1),
        ),
      ),
      groupsSpace: 10,
      barGroups: _getBarGroups(),
    );
  }

  static List<BarChartGroupData> _getBarGroups() {
    List<BarChartGroupData> barGroups = [];
    // Define your bar groups here
    // Example:
    barGroups.add(
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            fromY: 5,
            color: Colors.black, toY: 6,
          ),
        ],
      ),
    );
    return barGroups;
  }
}
