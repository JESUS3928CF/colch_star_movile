import 'package:flutter/material.dart';

class AlertHelper {
  static void showMessageSnackBar(BuildContext context, String errorMessage,
      [bool isError = true]) {
    Color backgroundColor = isError ? Colors.red : Colors.green;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

