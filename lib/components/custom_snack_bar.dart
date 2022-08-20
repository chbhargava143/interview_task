import 'package:flutter/material.dart';

customSnackbar(
    BuildContext context, String text, Color bgColor, Color textColor) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: TextStyle(color: textColor),
    ),
    duration: const Duration(milliseconds: 800),
    backgroundColor: bgColor,
  ));
}