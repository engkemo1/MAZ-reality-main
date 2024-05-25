import 'package:final_project/core/helpers/app_regex.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/core/widgets/app_text_form_field.dart';
import 'package:final_project/features/login/ui/widgets/password_validations.dart';
import 'package:final_project/features/signup/logic/cubit/signup_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAndTextFormField extends StatefulWidget {
  const TextAndTextFormField({super.key});

  @override
  State<TextAndTextFormField> createState() => _TextAndTextFormFieldState();
}

class _TextAndTextFormFieldState extends State<TextAndTextFormField> {
  bool isObscureText = true;
  bool isObscureConfirmText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.only(left: 12.0.h),
              child: Text(
                "Sign Up",
                style: TextStyles.font70BlackBold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0.h),
            child: SizedBox(
              width: 850.w,
              child: AppTextFormField(
                controller: context.read<SignupCubit>().nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                },
                text: "Your full Name",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.0.h),
            child: SizedBox(
              width: 850.w,
              child: AppTextFormField(
                controller: context.read<SignupCubit>().emailController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return "Please enter a valid email";
                  }
                },
                text: "Your email",
                keyboardtype: TextInputType.emailAddress,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.0.h),
            child: SizedBox(
              width: 850.w,
              child: AppTextFormField(
                  controller: context.read<SignupCubit>().passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid password";
                    }
                  },
                  keyboardtype: TextInputType.text,
                  text: "Password",
                  obscureText: isObscureText,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                        color: ColorsManager.darkGreen,
                      ))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.0.h),
            child: SizedBox(
              width: 850.w,
              child: AppTextFormField(
                  controller:
                      context.read<SignupCubit>().passwordConfirmController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid password";
                    } else if (value !=
                        context.read<SignupCubit>().passwordController.text) {
                      return "Password must be same as above";
                    }
                  },
                  keyboardtype: TextInputType.text,
                  text: "Password Confirm",
                  obscureText: isObscureConfirmText,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscureConfirmText = !isObscureConfirmText;
                        });
                      },
                      child: Icon(
                        isObscureConfirmText ? Icons.visibility_off : Icons.visibility,
                        color: ColorsManager.darkGreen,
                      ))),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
