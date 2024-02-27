import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: Column(
  children:  [
       Row(
         children: [
           Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                    image: AssetImage("/images/food.png"),
                    fit: BoxFit.cover, 
                  ),
            ),
           ),
           SizedBox(width: 10,),
           Container(
            height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("/images/food.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
         ],
       ),
       Row(
         children: [
           Container(),
           Container(),
         ],
       ),
       Row(
         children: [
           Container(),
           Container(),
         ],
       ),
  ],
),





    );
  }
}