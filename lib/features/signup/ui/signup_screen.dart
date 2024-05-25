import 'package:final_project/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:final_project/features/signup/ui/widgets/text_and_login.dart';
import 'package:final_project/features/signup/ui/widgets/text_and_textformfield.dart';
import 'package:final_project/features/signup/ui/widgets/text_elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 234, 225),
        body: SingleChildScrollView(
          child:  Column(  
          children: [
          const TextAndTextFormField(),
          const TextAndElvatedButton(),
            SizedBox(height: 9.5.h,),
          const TextAndLogin(),
        const SignupBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}