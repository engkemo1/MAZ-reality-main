import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "Don't have an account yet?",
                style: TextStyles.font29GrayRegular.copyWith(fontSize: 14.sp)),
      
          ]),
        ),
        TextButton(
            onPressed: () {
              context.pushNamed(Routes.signupScreen);
            },
            child: Text(
              'Sign Up',
              style: TextStyles.font32darkGreenBold,
            ))
      ],
    );
  }
}
