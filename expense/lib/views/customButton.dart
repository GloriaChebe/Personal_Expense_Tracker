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
    return Container(
      decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 40,
                          spreadRadius: 10)
                    ]),
      child: MaterialButton(
       
        
        onPressed: action,
        //  print("Button clicked ${userNameController.text}");
        color: primaryColor,
        hoverColor: primaryColor,
        height: 10,
      
        child: customText(
          label: buttonLabel,
          labelColor: textColor,
          
          
        
        ),
        //backgroundColor: primaryColor,
        elevation: 10,
        padding: const EdgeInsets.all(20),
        
      ),
    );
  }
}
