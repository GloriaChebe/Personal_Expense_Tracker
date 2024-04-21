import 'dart:convert';
import 'dart:html';
import 'package:expense/configs/constants.dart';
import 'package:expense/controllers/entriesController.dart';
import 'package:expense/models/entriesModel.dart';
import 'package:expense/views/barCharts.dart';
import 'package:expense/views/customEntries.dart';
import 'package:expense/views/customText.dart';
import 'package:expense/viewsPages/onPressed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



EntriesController entriesController = Get.put(EntriesController());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getEntries();
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
                      'Hello Gloria!',
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
                        //  Implement search functionality
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
              child: BarGraph(), // Assuming BarGraph is implemented elsewhere
            ),
            SizedBox(height: 20),
            // Transaction entries
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
}