import 'package:final_project/features/setting_screen/ui/widgets/all_buttons.dart';
import 'package:final_project/features/setting_screen/ui/widgets/profile_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 234, 225),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ProfileAndName(),
              SizedBox(height: 16.h),
              const AllButtons(),
            ],
          )),
    );
  }
}
