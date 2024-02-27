import 'package:expense/configs/constants.dart';
import 'package:flutter/material.dart';


class customText extends StatelessWidget {
  final String label;
  final Color labelColor;
  final double fontSize;
  final VoidCallback? onTap;
  const customText({
    Key? key,
    required this.label,
    this.labelColor = appGreyColor,
    this.fontSize = 16,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
