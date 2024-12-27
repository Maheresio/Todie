import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          minimumSize: WidgetStatePropertyAll(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
