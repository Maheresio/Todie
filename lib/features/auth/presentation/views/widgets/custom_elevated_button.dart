import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.radius10,
              ),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            Colors.red.shade300,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}
