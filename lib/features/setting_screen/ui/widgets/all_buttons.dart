import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllButtons extends StatelessWidget {
  const AllButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Column(
        children: [
          ElvatedButtonSetting(
            onPressed: () {
              context.pushNamed(Routes.editProfileScreen);
            },
            text: "Edit Profile",
            colorButton: ColorsManager.lighterBrown,
            fontSize: 16,
            fontWeight: FontWeightHelper.regular,
          ),
          SizedBox(
            height: 15.h,
          ),
          ElvatedButtonSetting(
              onPressed: () {},
              text: "Add Post  ",
              colorButton: ColorsManager.lighterBrown,
              fontSize: 16,
              fontWeight: FontWeightHelper.regular),
          SizedBox(
            height: 15.h,
          ),
          ElvatedButtonSetting(
            onPressed: () {
              context.pushNamed(Routes.changePasswordScreen);
            },
            text: "Change Password",
            colorButton: ColorsManager.lighterBrown,
            fontSize: 16,
            fontWeight: FontWeightHelper.regular,
          ),
          SizedBox(
            height: 15.h,
          ),
          ElvatedButtonSetting(
              onPressed: () {},
              text: "About         ",
              colorButton: ColorsManager.lighterBrown,
              fontSize: 16,
              fontWeight: FontWeightHelper.regular),
          SizedBox(
            height: 15.h,
          ),
          ElvatedButtonSetting(
              onPressed: () {},
              text: "Privacy    ",
              colorButton: ColorsManager.lighterBrown,
              fontSize: 16,
              fontWeight: FontWeightHelper.regular),
          SizedBox(
            height: 25.h,
          ),
          ElvatedButtonSetting(
              onPressed: () {
                SharedPres.removeToken();
                SharedPres.removeUserId();

                context.pushNamedAndRemoveUntil(
                  Routes.loginScreen,
                  predicate: (route) => false,
                );
              },
              text: "Log out  ",
              colorButton: ColorsManager.linear,
              fontSize: 18,
              fontWeight: FontWeightHelper.bold),
        ],
      ),
    );
  }
}
