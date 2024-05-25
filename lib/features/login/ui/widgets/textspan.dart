
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';

class Textspan extends StatelessWidget {
  const Textspan({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "By logging, you agree to our ",
          style: TextStyles.font29GrayRegular
        ),
        TextSpan(
          text: 'Terms & Conditions ',
          style: TextStyles.font30DarkGreenMedium
        ),
        TextSpan(
          text: ' and \n',
          style: TextStyles.font29GrayRegular
        ),
        TextSpan(
          text: ' PrivacyPolicy.',
          style: TextStyles.font30DarkGreenMedium.copyWith(height: 1.5)
        )
      ]));
  }
}
