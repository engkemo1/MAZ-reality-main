import 'package:final_project/features/onboarding/ui/widgets/get_started_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/imgs/icone_home.png",
          width: double.infinity.w,
          height: 260.h,
        ),
        Image.asset(
          "assets/imgs/home.png",
          width: double.infinity.w,
          height: .7.sh,
          fit: BoxFit.fill,
        ),
        const Positioned(
          bottom: 75,
          left: 87,
          child: GetStartedButton(),
        )
      ],
    );
  }
}
