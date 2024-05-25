
import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/core/widgets/loader.dart';
import 'package:final_project/features/edit_profile/data/models/change_password_body.dart';
import 'package:final_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/update_profile_cubit.dart';
import '../logic/update_profile_state.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isObscureText = true;
  final _passwordCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  final _oldPassCtrl = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateProfileCubit>(
      create: (context) => getIt<UpdateProfileCubit>(),
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              Loader.instance.show(context);
            },
            success: (loginResponse) {
              Loader.instance.hide();
              setupSuccessState(context, "تم التحديث بنجاح");
            },
            error: (error) {
              Loader.instance.hide();
              setupErrorState(context, error);
            },
          );
        },
        builder: (context, state) => Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 234, 225),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 234, 225),
            title: Text(
              "Change Password",
              style: TextStyles.font35BlackBold.copyWith(fontSize: 18.sp),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8.h),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _oldPassCtrl,
                      decoration: const InputDecoration(
                          label: Text("old password"), prefixIcon: Icon(Icons.fingerprint)),
                    ),
                    SizedBox(height: 5.h),
                    TextFormField(
                      obscureText: isObscureText,
                      controller: _passwordCtrl,
                      decoration: InputDecoration(
                          label: const Text("Password"),
                          prefixIcon: const Icon(Icons.fingerprint),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText ? Icons.visibility_off : Icons.visibility,
                            ),
                          )),
                    ),
                    TextFormField(
                      obscureText: isObscureText,
                      controller: _confirmPassCtrl,
                      decoration: InputDecoration(
                          label: const Text("confirm Password"),
                          prefixIcon: const Icon(Icons.fingerprint),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText ? Icons.visibility_off : Icons.visibility,
                            ),
                          )),
                    ),
                    SizedBox(height: 25.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => _changePassword(context),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.linear,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: Text(
                            "Submit",
                            style: TextStyles.font35BlackBold.copyWith(
                              fontSize: 16.sp,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _changePassword(BuildContext context) {
    if (_key.currentState!.validate()) {
      context.read<UpdateProfileCubit>().updatePassword(
            ChangePasswordBody(
              passwordCurrent: _oldPassCtrl.text,
              password: _passwordCtrl.text,
              passwordConfirm: _confirmPassCtrl.text,
            ),
          );
    }
  }
}
