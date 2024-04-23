import 'dart:convert';
import 'dart:html';
import 'package:expense/configs/constants.dart';
import 'package:expense/controllers/entriesController.dart';
import 'package:expense/controllers/userController.dart';
import 'package:expense/models/entriesModel.dart';
import 'package:expense/views/barCharts.dart';
import 'package:expense/views/customEntries.dart';
import 'package:expense/views/customText.dart';
import 'package:expense/viewsPages/onPressed.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

EntriesController entriesController = Get.put(EntriesController());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<CurrentUserController>();
    getEntries().then((value) => null);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    title: Text(
                      'Hello ${userController.user.value?.userName ?? 'User'}!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () {
                       
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(label: "Total Expenditure: Ksh 2350"),
              ],
            ),
            Container(
              height: 300,
              child:Obx(() =>  BarGraph(entries: entriesController.entriesList.value), ),
            ),
            // _buildChart(context),
            SizedBox(height: 20),
            
            Obx(
              () => Column(
                children: List.generate(
                  entriesController.entriesList.length,
                  (index) {
                    final entry = entriesController.entriesList[index];
                    return Column(
                      children: [
                        Entries(
                          imageUrl: "images/${entry.image}",
                          titleText: entry.categoryName,
                          subTitleText: entry.item,
                          amount: double.parse(entry.amount),
                          onDelete: ()async {
                            await deleteEntry(entry.entriesID);
                          },
                        ),
                        SizedBox(height: 15), // Add space between entries
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 200), // Additional space at the bottom
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PressedPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildChart(BuildContext context){
    return Container(height: MediaQuery.of(context).size.height * 0.4,
    child: BarChart(BarChartData(
            borderData: FlBorderData(
                border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
            )),
            groupsSpace: 6,

            // add bars
            barGroups: [
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: 10, width: 15, color: Colors.blue),
              ],),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(toY: 9, width: 15, color: Colors.blue),
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(toY: 4, width: 15, color: Colors.blue),
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(toY: 2, width: 15, color: Colors.blue),
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(toY: 13, width: 15, color: Colors.blue),
              ]),
              BarChartGroupData(x: 6, barRods: [
                BarChartRodData(toY: 17, width: 15, color: Colors.blue),
              ]),
              BarChartGroupData(x: 7, barRods: [
                BarChartRodData(toY: 19, width: 15, color: Colors.blue),
              ]),
              BarChartGroupData(x: 8, barRods: [
                BarChartRodData(toY: 21, width: 15, color: Colors.blue),
              ]),
            ])),
      
    );
  }

  Future<void> getEntries() async {
    try {
      final response = await http.get(Uri.parse("https://sanerylgloann.co.ke/ExpenseEase/readEntries.php"));
      if (response.statusCode == 200) {
        final serverResponse = json.decode(response.body);
        final entries = (serverResponse['userdata'] as List).map((entry) => Entry.fromJson(entry)).toList();
        entriesController.updateEntriesList(entries);
      } else {
        print("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching entries: $e");
    }
  }

  Future<void> deleteEntry(int entriesID) async {
  try {
    print(entriesID);
  
    final response = await http.get(
      Uri.parse("https://sanerylgloann.co.ke/ExpenseEase/deleteEntries.php?entriesID=$entriesID"),
      
    );
    if (response.statusCode == 200) {
      final serverResponse = json.decode(response.body);
      final success = serverResponse['success'];
      if (success == 1) {
        print(serverResponse);
        print("Entry deleted successfully");
        getEntries();
      } else {
        print("Failed to delete entry");
      }
    } else {
      print("Server error: ${response.statusCode}");
    }
  } catch (e) {
    print("Error deleting entry: $e");
  }
}
}