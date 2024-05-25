import 'package:final_project/core/helpers/app_regex.dart';
import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/core/widgets/app_elevated_button.dart';
import 'package:final_project/core/widgets/app_text_form_field.dart';
import 'package:final_project/features/login/logic/cubit/login_cubit.dart';
import 'package:final_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldEmailAndPass extends StatefulWidget {
  const TextFieldEmailAndPass({super.key});
  @override
  State<TextFieldEmailAndPass> createState() => _TextFieldEmailAndPassState();
}

class _TextFieldEmailAndPassState extends State<TextFieldEmailAndPass> {
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
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
      key: context.read<LoginCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.only(top: 0.h, bottom: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0.h, left: 12.h),
              child: SizedBox(
                width: 850.w,
                child: AppTextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return "Please enter a valid email";
                    }
                  },
                  controller: context.read<LoginCubit>().emailController,
                  text: "Your email",
                  keyboardtype: TextInputType.emailAddress,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0.h, left: 12.h),
              child: SizedBox(
                width: 850.w,
                child: AppTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid password";
                    }
                  },
                  controller: context.read<LoginCubit>().passwordController,
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
                    ),
                  ),
                ),
              ),
            ),

            // SizedBox(
            //   height: 12.h,
            // ),
            // PasswordValidations(
            //   hasLowerCase: hasLowerCase,
            //   hasUpperCase: hasUpperCase,
            //   hasMinLength: hasMinLength,
            //   hasNumber: hasNumber,
            //   hasSpecialCharacters: hasSpecialCharacters,
            // ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0.h),
              child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.forgetPasswordScreen);
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyles.font32darkGreenBold,
                    ),
                  )),
            ),
                        const LoginBlocListener(),      
            Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: AppElvatedButton(
                  text: "Log in",
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                )),
                                  

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitLoginState();
  }
}
