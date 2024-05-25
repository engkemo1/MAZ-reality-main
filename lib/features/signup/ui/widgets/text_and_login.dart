import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAndLogin extends StatelessWidget {
  const TextAndLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0.h),
          child: Row(
            children: [
              const Expanded(
                  child: Divider(
                thickness: 0.9,
                color: ColorsManager.gray,
              )),
              Text(
                "OR",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: ColorsManager.gray,
                    fontWeight: FontWeightHelper.bold),
              ),
              const Expanded(
                  child: Divider(
                thickness: 0.9,
                color: ColorsManager.gray,
              )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8.0.h,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyles.font35BlackBold,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0.h,
              ),
              child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    "Log In",
                    style: TextStyles.font32lightGreenBold,
                  ),
                  ),
            ),
          ],
        )
      ],
    );
  }
}
