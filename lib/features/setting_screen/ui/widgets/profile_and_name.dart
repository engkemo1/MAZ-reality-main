import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/font_weight_helper.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/setting_screen/data/models/user_response.dart';
import 'package:final_project/features/setting_screen/logic/cubit/user_cubit.dart';
import 'package:final_project/main.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAndName extends StatefulWidget {
  const ProfileAndName({super.key});

  @override
  State<ProfileAndName> createState() => _ProfileAndNameState();
}

class _ProfileAndNameState extends State<ProfileAndName> {
  UserInfoResponse user = UserInfoResponse();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<UserCubit>(context).emitGetUserDetails("${prefs!.getString('token')}");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 27.h, left: 16.w),
          child: CircleAvatar(
              radius: 35.r,
              backgroundImage: const AssetImage("assets/imgs/profile.png")),
        ),
        Padding(
            padding: EdgeInsets.only(top: 26.h, left: 18.w),
            child: BlocBuilder<UserCubit, UserState>
            (builder: (context, state) {
              if (state is GetUserDetails) {
                user = state.userInfoResponse;
                return Column(
                children: [
                  Text(
                    user.data!.user!.name.toString(),
                    style: TextStyles.font32DarkBlueMedium.copyWith(
                        fontWeight: FontWeightHelper.bold, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Text(
                    user.data!.user!.email.toString(),
                    style: TextStyles.font25DarkGrayRegular.copyWith(
                        color: ColorsManager.lightBrown, fontSize: 14.sp),
                  )
                ],
              );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.darkBlue,
                  ),
                );
              }
            
            }
            )
            
            )
      ],
    );
  }
}
