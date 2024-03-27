import 'package:expense/configs/constants.dart';
import 'package:expense/views/customCategoes.dart';
import 'package:expense/views/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back), onPressed: () => Get.toNamed("/homepage")),
        automaticallyImplyLeading: true,
        backgroundColor: primaryColor.withOpacity(0.8),
      ),
      backgroundColor: appwhiteColor, // Set overall background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customText(label: "CATEGORIES",fontSize: 20,labelColor: Colors.black,),
              SizedBox(height: 20,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFeatures(imageUrl:"images/food.png" , title:"FOOD", ),
                  
                  SizedBox(width: 50),
                  MyFeatures(imageUrl: "images/cloth.png", title: "CLOTHES"),
                  
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFeatures(imageUrl:"images/health.png" , title: "HEALTH"),
                  
                  SizedBox(width: 50),
                  MyFeatures(imageUrl:"images/house.png" , title: "HOUSING"),
                 
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFeatures(imageUrl: "images/transport.png", title:"TRANSPORT" ),
                 
                  SizedBox(width: 50),
                  MyFeatures(imageUrl:"images/other.png" , title: "OTHER"),
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
