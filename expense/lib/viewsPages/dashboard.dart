import 'package:expense/viewsPages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:expense/configs/constants.dart';
import 'package:expense/controllers/homeControllers.dart';
import 'package:expense/viewsPages/account.dart';
import 'package:expense/viewsPages/categories.dart';
import 'package:expense/viewsPages/settings.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';

HomeController homeController = Get.put(HomeController());

class HomePage extends StatelessWidget {
  final List<Widget> screens = [
    Home(),
   // CategoriesPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Obx(() => screens[homeController.selectedPage.value]),
      bottomNavigationBar: GNav(
        color: primaryColor,
        backgroundColor: primaryColor.withOpacity(0.2),
        tabBackgroundColor: primaryColor.withOpacity(0.5),
        tabs: [
          GButton(
            icon: Icons.home,
            iconColor: appBlackColor,
            text: 'Home',
          ),
          // GButton(
          //   icon: Icons.category,
          //   iconColor: appBlackColor,
          //   text: 'Categories',
          // ),
          GButton(
            icon: Icons.settings,
            iconColor: appBlackColor,
            text: 'Settings',
          ),
          GButton(
            icon: Icons.person,
            iconColor: appBlackColor,
            text: 'Profile',
          ),
        ],
        selectedIndex: homeController.selectedPage.value,
        onTabChange: (index) {
          homeController.updateselectedpage(index);
        },
      ),
    );
  }
}
