import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomelogoAndText extends StatelessWidget {
  const HomelogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
mainAxisAlignment: MainAxisAlignment.center,      
children: [
        Image.asset(
          "assets/imgs/maz.png",
          color: ColorsManager.darkPurple,
          height: 95.h,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Welcome back! Sign in using your social\n account or email to continue us",
            style: TextStyles.font32GrayBold,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
