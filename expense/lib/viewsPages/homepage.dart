import 'package:expense/configs/constants.dart';
import 'package:expense/views/barCharts.dart';
import 'package:expense/views/customEntries.dart';
import 'package:expense/views/customText.dart';
import 'package:expense/viewsPages/onPressed.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        //  search
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
              child: BarGraph(),
            ),
            SizedBox(height: 20),
            // Transaction entries
            // Implement the transaction entries widget here
            customText(
              label: '2/24/2023',
              fontSize: 12,
            ),
            SizedBox(height: 15),
           
            Entries(
              imageUrl: "images/cloth.png",
              titleText: "CLOTHES",
              subTitleText: "Tshirt",
              amount: 750,
              
            ),
            SizedBox(height: 15),
            Entries(
              imageUrl: "images/house.png",
              titleText: "HOUSING",
              subTitleText: "Rent",
              amount: 25000,
            ),
            SizedBox(height: 15),
            Entries(
              imageUrl: "images/food.png",
              titleText: "FOOD",
              subTitleText: "fish",
              amount: 1000,
            ),
            SizedBox(height: 30),
            customText(
              label: '2/22/2024',
              fontSize: 12,
            ),
            SizedBox(height: 15),
            Entries(
              imageUrl: "images/health.png",
              titleText: "HEALTH",
              subTitleText: "Surgery",
              amount: 1000,
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
}
