import 'package:expense/configs/constants.dart';
import 'package:flutter/material.dart';
import 'customText.dart';

class customButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback? action;
  final Color color, textColor;
  const customButton({
    super.key,
    required this.buttonLabel,
    this.action,
    this.color = primaryColor,
    this.textColor =appwhiteColor,
  });

  //final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
     
      
      onPressed: action,
      //  print("Button clicked ${userNameController.text}");
      color: primaryColor,
      hoverColor: primaryColor,
      child: customText(
        label: buttonLabel,
        labelColor: textColor,
      
      ),

      //backgroundColor: primaryColor,
      elevation: 10,
      padding: const EdgeInsets.all(20),
    );
  }
}
