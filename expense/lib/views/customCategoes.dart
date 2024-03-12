import 'package:expense/configs/constants.dart';
import 'package:flutter/material.dart';

class MyFeatures extends StatelessWidget {
  final String imageUrl;
  final String title;

  const MyFeatures({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(color: appGreyColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 0.1,
                color: primaryColor.withOpacity(0.2),
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(
                imageUrl,
                height: 90,
                width: 110,
              ),
              SizedBox(height: 0),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
