import 'package:flutter/material.dart';

class Entries extends StatelessWidget {
  final String imageUrl;
  final String titleText;
  final String subTitleText;
  final double amount;
  const Entries({
    required this.imageUrl,
    required this.titleText,
    required this.subTitleText,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    //color: Color.fromARGB(255, 246, 240, 240),
                    child: Image.asset(imageUrl),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(width: 20,),
                  Row(
                    
                    children: [
                      Column(
                        children: [
                          Text(titleText),
                          Text(subTitleText),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
               SizedBox(width: 20,),
              Text(
                "Ksh:$amount",
              ),
            ],
          )
        ],
      ),
    );
  }
}
