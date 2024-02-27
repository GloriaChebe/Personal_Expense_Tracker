import 'package:expense/configs/constants.dart';
import 'package:expense/controllers/homeControllers.dart';
import 'package:expense/views/barCharts.dart';
import 'package:expense/views/customEntries.dart';
import 'package:expense/views/customText.dart';
import 'package:expense/viewsPages/categories.dart';
import 'package:expense/viewsPages/onPressed.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

HomeController homeController = Get.put(HomeController());
var screens = [
  const HomePage(),
 CategoriesPage(),
  //SettingsPage (),
  //AccountPage(),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(automaticallyImplyLeading: true,
      
     // backgroundColor: primaryColor.withOpacity(0.8),
     //),
      bottomNavigationBar: GNav(
        color: primaryColor,
        backgroundColor: primaryColor.withOpacity(0.08),
        tabBackgroundColor: primaryColor.withOpacity(0.5),
        tabs: [
          GButton(
            icon: Icons.home,
            iconColor: appBlackColor,
            text: 'Home',
          onPressed: () {
                Navigator.pushNamed(context, '/home');
              }
          ),
          GButton(
            icon: Icons.category,
             iconColor: appBlackColor,
            text: 'Categories',
            onPressed: () {
                Navigator.pushNamed(context, '/categories');
              }
          ),
          GButton(
            icon: Icons.settings,
             iconColor: appBlackColor,
            text: 'Settings',
          ),
          GButton(
            icon: Icons.person,
             iconColor: appBlackColor,
            text: 'Profile',
          )
        ],
        onTabChange: (index) {
          homeController.updateselectedpage(index);
          // print("clicked$index");
        },
      ),
      body: Column(
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
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Gloria!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
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
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: CustomBarChart(MyBarChartData.getChartData())),

          SizedBox(height: 20),
          // Transaction entries
          // Implement the transaction entries widget here
          Spacer(),
          customText(
            label: '2/24/2023',
            fontSize: 12,
          ),
          SizedBox(
            height: 15,
          ),

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
              amount: 25000),
              SizedBox(height: 15),
          Entries(
              imageUrl: "images/food.png",
              titleText: "FOOD",
              subTitleText: "fish",
              amount: 1000),
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
              amount: 1000),

          Spacer(),

         // Container(),
          // Obx(
          // () => Center(child: screens[homeController.selectedPage.value]),

          //),
        ],
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
