import 'package:final_project/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:final_project/features/login/ui/widgets/homelogo_and_text.dart';
import 'package:final_project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:final_project/features/login/ui/widgets/textfield_email_and_pass.dart';
import 'package:final_project/features/login/ui/widgets/textspan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const HomelogoAndText(),
                    const TextFieldEmailAndPass(),
                    const Textspan(),
                    SizedBox(height: 9.5.h),
                    const DontHaveAnAccount(),
                    const LoginBlocListener()
                  ],
                ),
              );
            } else {
              return buildNoInterNetWidget();
            }

            // },child: const Center(child: CircularProgressIndicator(color: ColorsManager.lightBrown,),),
          },
          child: const SizedBox(),
        ),
      ),
    );
  }
}

Widget buildNoInterNetWidget() {
  return Center(
    child: Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 45.h,
          ),
          Text(
            "Can't connect .. Check the internet",
            style: TextStyle(color: Colors.grey, fontSize: 40.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Image.asset("assets/imgs/no_internet.png")
        ],
      ),
    ),
  );
}
