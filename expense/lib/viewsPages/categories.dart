import 'package:expense/configs/constants.dart';
import 'package:expense/views/customCategoes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () => Get.toNamed("/homepage")),
        automaticallyImplyLeading: true,
        backgroundColor: primaryColor.withOpacity(0.3),
      ),
      backgroundColor: appwhiteColor, // Set overall background color
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFeatures(imageUrl:"images/food.png" , title:"FOOD", ),
                
                SizedBox(width: 100),
                MyFeatures(imageUrl: "images/cloth.png", title: "CLOTHES"),
                
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFeatures(imageUrl:"images/health.png" , title: "HEALTH"),
                
                SizedBox(width: 100),
                MyFeatures(imageUrl:"images/house.png" , title: "HOUSING"),
               
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFeatures(imageUrl: "images/transport.png", title:"TRANSPORT" ),
               
                SizedBox(width: 100),
                MyFeatures(imageUrl:"images/other.png" , title: "OTHER"),
               
              ],
            ),
          ],
        ),
      ),
    );
  }

  /*Widget _buildCategoryItem({required String imageUrl, required String title}) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }*/
}
