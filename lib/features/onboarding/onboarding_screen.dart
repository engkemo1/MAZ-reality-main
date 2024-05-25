import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/helpers/shared_pres.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/widgets/home_image.dart';
import 'ui/widgets/home_logo.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SharedPres.getToken().then((value) {
        if (value != null) {
          if (prefs?.getString("role") == "admin") {
            context.pushNamedAndRemoveUntil(Routes.lawyerScreen,
                predicate: (route) => false);
          } else {
            context.pushNamedAndRemoveUntil(Routes.homeScreen,
                predicate: (route) => false);
          }
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                //This is (h) if you say on the iPhone in Android 30 as a percentage
                top: 30.h,
                bottom: 0.h),
            child: Column(
              children: [
                const HomeLogo(),
                SizedBox(
                  height: 30.h,
                ),
                const HomeImage()
              ],
            ),
          ),
        )));
  }
}
