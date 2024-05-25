import 'package:final_project/core/theming/colors.dart';
import 'package:flutter/material.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/imgs/maz.png",
          color: ColorsManager.darkPurple,
          width: 222,
          height: 197,
        )
      ],
    );
  }
}
