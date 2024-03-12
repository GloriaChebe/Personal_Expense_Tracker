import 'package:flutter/material.dart';
import 'package:expense/barGraph/myBarGraph.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({Key? key}) : super(key: key);

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  List<double> weeklyExpense = [
    70,
    400,
    100,
    140,
    880.8,
    900,
    450,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          height: 250, 
          child: MyBarGraph(weeklyExpense: weeklyExpense),
        ),
      ),
    );
  }
}
