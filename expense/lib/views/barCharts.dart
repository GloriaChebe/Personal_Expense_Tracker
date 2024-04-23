import 'package:expense/models/entriesModel.dart';
import 'package:flutter/material.dart';
import 'package:expense/barGraph/myBarGraph.dart';

// class BarGraph extends StatefulWidget {
 

//   @override
//   State<BarGraph> createState() => _BarGraphState();
// }

class BarGraph extends StatelessWidget {
   const BarGraph( {super.key, required this.entries,});
  final List<Entry> entries;
  // List<double> weeklyExpense = [
  //   70,
  //   400,
  //   100,
  //   140,
  //   880.8,
  //   900,
  //   450,
  // ];

  List <double> _buildGraphEntries(){
   Map<int, double> dailyTotals = <int, double>{
    0: 0.0,
    1: 0.0,
    2: 0.0,
    3: 0.0,
    4: 0.0,
    5: 0.0,
    6: 0.0,
  };
   for (final entry in entries) {
    // Get the day of the week (0 = Monday, 6 = Sunday)
    final dayOfWeek = entry.createdAt.weekday;
    print("day: $dayOfWeek == > ${entry.amount}");

    // Update the daily total for the corresponding day
    dailyTotals[dayOfWeek] = (dailyTotals[dayOfWeek]??0) + double.parse(entry.amount);
  }

  // Create a list of daily totals in the order Mon-Sun
  final dailyTotalsList = [
    dailyTotals[1]!,
    dailyTotals[2]!,
    dailyTotals[3]!,
    dailyTotals[4]!,
    dailyTotals[5]!,
    dailyTotals[6]!,
    dailyTotals[7]!,
  ];

  print(dailyTotalsList);
  return dailyTotalsList;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          height: 250, 
          child: MyBarGraph(weeklyExpense: _buildGraphEntries()),
        ),
      ),
    );
  }
}
