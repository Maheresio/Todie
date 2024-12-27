import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_constants.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key, required this.image, required this.text, this.onPressed});
  final String image;
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.radius10,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        label: Text(
          text,
        ),
        icon: Padding(
          padding: EdgeInsetsDirectional.only(
            end: 10.w,
          ),
          child: SvgPicture.asset(
            image,
            height: 24.h,
            width: 24.w,
          ),
        ),
      ),
    );
  }
}
