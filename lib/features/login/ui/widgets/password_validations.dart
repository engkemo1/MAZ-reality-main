import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 12.0.h),
      child: Column(
        children: [
          buildValidationRow('At least 1 lowercase letter', hasLowerCase),
          SizedBox(
            width: 5.sp,
          ),
          buildValidationRow('At least 1 uppercase letter', hasUpperCase),
          SizedBox(
            width: 5.sp,
          ),
          buildValidationRow('At least 1 special characters', hasSpecialCharacters),
          SizedBox(
            width: 5.sp,
          ),
          buildValidationRow('At least 1  number', hasNumber),
          SizedBox(
            width: 5.sp,
          ),
          buildValidationRow('At least 8 characters long', hasMinLength),
        ],
      ),
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        SizedBox(
          height: 6.sp,
        ),
        Text(
          text,
          style: TextStyles.font32darkGreenBold.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color:
                  hasValidated ? ColorsManager.gray : ColorsManager.darkBlue),
        )
      ],
    );
  }
}
