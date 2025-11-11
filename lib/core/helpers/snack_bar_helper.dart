import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar(
      BuildContext context, {
        required String message,
        bool isError = false,
      }) {
    final color = isError ? Colors.red : Colors.green;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
