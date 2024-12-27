import 'package:flutter/material.dart';

void displaySnackBar(context, {required content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red.shade300,
      content: Center(
        child: Text(
          content,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ),
  );
}
