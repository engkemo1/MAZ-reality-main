import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/core/widgets/app_elevated_button.dart';
import 'package:final_project/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAndElvatedButton extends StatelessWidget {
  const TextAndElvatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0.h),
          child: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: "By continuing you agree to our ",
                style: TextStyles.font35BlackBold,
              ),
              TextSpan(
                text: " Terms of Service\n",
                style: TextStyles.font32lightGreenBold,
              ),
              TextSpan(
                text: "   and ",
                style: TextStyles.font35BlackBold.copyWith(height: 1.5),
              ),
              TextSpan(
                text: "Privacy Policy.",
                style: TextStyles.font32lightGreenBold,
              )
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.0.h),
          child: AppElvatedButton(
            text: "Sign Up",
            onPressed: () {
              validateThenDoSignup(context);
            },
          ),
        )
      ],
    );
  }
  
}

void validateThenDoSignup(BuildContext context) {
  if (context.read<SignupCubit>().formKey.currentState!.validate()) {
    context.read<SignupCubit>().emitSignupState();
  }
}
