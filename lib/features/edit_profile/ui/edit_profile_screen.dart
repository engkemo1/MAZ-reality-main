import 'dart:io';

import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/helpers/extensions.dart';
import 'package:final_project/core/helpers/image_picker_service.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/core/widgets/loader.dart';
import 'package:final_project/features/edit_profile/data/models/update_request_body.dart';
import 'package:final_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../logic/update_profile_cubit.dart';
import '../logic/update_profile_state.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isObscureText = true;
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  File? image;

  @override
  void initState() {
    if (USER_DATA != null) {
      _nameCtrl.text = USER_DATA!.data!.user!.name ?? "";
      _emailCtrl.text = USER_DATA!.data!.user!.email ?? "";
      _phoneCtrl.text = USER_DATA!.data!.user!.phone ?? "";
    }
    super.initState();
  }

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
              "Edit Profile",
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
              child: Column(children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: InkWell(
                        onTap: () async {
                          image = await selectImageFromLocal(context, ImageSource.gallery);
                          setState(() {}); //
                        },
                        child: CircleAvatar(
                          radius: 60,
                          child: image != null
                              ? Image.file(image!, fit: BoxFit.fill)
                              : Image.asset("assets/imgs/profile.png", fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100), color: ColorsManager.darkBrown),
                        child: const Icon(Icons.camera_alt_outlined, color: Colors.black, size: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameCtrl,
                        decoration:
                            const InputDecoration(label: Text("Full Name"), prefixIcon: Icon(Icons.person_2)),
                      ),
                      SizedBox(height: 5.h),
                      TextFormField(
                        controller: _emailCtrl,
                        decoration: const InputDecoration(
                            label: Text("Email"), prefixIcon: Icon(Icons.email_outlined)),
                      ),
                      SizedBox(height: 5.h),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneCtrl,
                        decoration: const InputDecoration(
                          label: Text("PhoneNo"),
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => _updateProfile(context),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.linear,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: Text(
                              "Edit Profile",
                              style: TextStyles.font35BlackBold.copyWith(
                                fontSize: 16.sp,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _updateProfile(BuildContext context) {
    if (_key.currentState!.validate()) {
      context.read<UpdateProfileCubit>().updateProfile(
            UpdateRequestBody(
              name: _nameCtrl.text,
              email: _emailCtrl.text,
              phone: _phoneCtrl.text,
            ),
            image: image,
          );
    }
  }
}
