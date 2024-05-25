import 'package:final_project/features/home_details/ui/widgets/posts.dart';
import 'package:final_project/features/home_details/ui/widgets/search_and_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 234, 225),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchAndNotification(),
            SizedBox(
              height: 9.5.h,
            ),
            const Posts()
          ],
        ),
      ),

    );
  }
}
