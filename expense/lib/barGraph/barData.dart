import 'package:expense/barGraph/individualBarGraph.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  late List<IndividualBar> barData;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  }) {
    initializedBarData();
  }

  void initializedBarData() {
    barData = List.generate(7, (index) {
      switch (index) {
        case 0:
          return IndividualBar(x: index, y: sunAmount);
        case 1:
          return IndividualBar(x: index, y: monAmount);
        case 2:
          return IndividualBar(x: index, y: tueAmount);
        case 3:
          return IndividualBar(x: index, y: wedAmount);
        case 4:
          return IndividualBar(x: index, y: thurAmount);
        case 5:
          return IndividualBar(x: index, y: friAmount);
        case 6:
          return IndividualBar(x: index, y: satAmount);
        default:
          throw ArgumentError('Invalid index: $index');
      }
    });
  }
}
