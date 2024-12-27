import 'package:flutter/material.dart';

void displaySnackBar(context, {required content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      
      content: Text(
        content,
      ),
    ),
  );
}
