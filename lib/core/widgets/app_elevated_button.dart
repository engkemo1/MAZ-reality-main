import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElvatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AppElvatedButton({required this.text, required this.onPressed, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .85.sw,
      child: ElevatedButton(
        onPressed: onPressed,
        // ignore: sort_child_properties_last
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.bold),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          ),
          backgroundColor: MaterialStateProperty.all(ColorsManager.darkBlue),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h))),
        ),
      ),
    );
  }
}
