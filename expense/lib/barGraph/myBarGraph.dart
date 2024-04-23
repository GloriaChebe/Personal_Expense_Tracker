import 'package:expense/barGraph/barData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
 final List weeklyExpense;
  const MyBarGraph({super.key, required this.weeklyExpense});

  @override
  Widget build(BuildContext context) {
    BarData myBarData=BarData(sunAmount: weeklyExpense[0],
     monAmount: weeklyExpense[1], 
     tueAmount: weeklyExpense[2],
      wedAmount: weeklyExpense[3], 
      thurAmount: weeklyExpense[4], 
      friAmount: weeklyExpense[5], 
      satAmount: weeklyExpense[6],);
    return BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget: getBottomTitles,))
        ),
        maxY: 10000,
        minY: 0,
      
        barGroups: myBarData.barData.map((data) => BarChartGroupData(x: data.x,barRods: [BarChartRodData(toY: data.y,
        color: Colors.blue,width: 25,borderRadius: BorderRadius.circular(6),
        backDrawRodData: BackgroundBarChartRodData(show: true,toY:1000,color: Colors.grey[300]))]))
        .toList(),
        
        
      )

    );
    
  }
  
  }
  Widget getBottomTitles(double value,TitleMeta meta){
    const style=TextStyle(
color: Colors.grey,
fontWeight: FontWeight.bold,
fontSize: 14
    );
    Widget text;
    switch (value.toInt()) {
      case 6:
       text=const Text("Sun",style: style,) ;
        break;
        case 0:
      text = const Text(
        "Mon",
        style: style,
      );
      break;
      case 1:
      text = const Text(
        "Tue",
        style: style,
      );
      break;
      case 2:
      text = const Text(
        "Wed",
        style: style,
      );
      break;
      case 3:
      text = const Text(
        "Thur",
        style: style,
      );
      break;
      case 4:
      text = const Text(
        "Fri",
        style: style,
      );
      break;
      case 5:
      text = const Text(
        "Sat",
        style: style,
      );
      break;
      default:
      text = const Text(
        "",
        style: style,
      );
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide) ; 
  }
