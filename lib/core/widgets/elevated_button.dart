import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElvatedButtonSetting extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color colorButton;
  final double fontSize;
  final double? width, height;
  final FontWeight fontWeight;

  const ElvatedButtonSetting(
      {required this.fontSize,
      required this.fontWeight,
      required this.text,
      required this.onPressed,
      required this.colorButton,
      this.width,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? .85.sw,
      height: height ?? 45.h,
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            ),
            backgroundColor: MaterialStateProperty.all(colorButton),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.h)),
            ),
          ),
          child: Text(
            text,
            style: TextStyles.font25DarkGrayRegular
                .copyWith(color: Colors.black, fontSize: fontSize.sp, fontWeight: fontWeight),
          )),
    );
  }
}
