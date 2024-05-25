import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/core/theming/styles.dart';
import 'package:final_project/features/details/logic/details_cubit.dart';
import 'package:final_project/features/favorite/logic/favorites_cubit.dart';
import 'package:final_project/features/favorite/ui/favorite_screen.dart';
import 'package:final_project/features/home/controller/main_wrapper_controller.dart';
import 'package:final_project/features/home_details/ui/home_details.dart';
import 'package:final_project/features/add_post_screen/ui/add_post_screen.dart';
import 'package:final_project/features/my_ads/logic/my_ads_cubit.dart';
import 'package:final_project/features/setting_screen/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../my_ads/ui/my_ads_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MainWrapperController controller = Get.put(MainWrapperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 234, 225),
      body: PageView(
        onPageChanged: controller.animateToPage,
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeDetailsScreen(),
          MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<FavoritesCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<DetailsCubit>(),
            ),
          ], child: const FavoriteScreen()),
          AddPostScreen(),
          BlocProvider(
              create: (context) => getIt<MyAdsCubit>(),
              child: const MyAdsScreen()),
          const SettingsScreen()
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          notchMargin: 10,
          elevation: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomAppBarItem(context,
                        icon: IconlyLight.home, page: 0, label: "Home"),
                    _bottomAppBarItem(context,
                        icon: IconlyLight.star, page: 1, label: "Favourite"),
                    _bottomAppBarItem(context,
                        icon: Icons.add_circle, page: 2, label: "Add Post"),
                    _bottomAppBarItem(context,
                        icon: IconlyLight.star, page: 3, label: "My posts"),
                    _bottomAppBarItem(context,
                        icon: IconlyLight.setting, page: 4, label: "Settings"),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () {
        controller.goToPage(page);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color: controller.currentIndex == page
                    ? ColorsManager.blue
                    : ColorsManager.lightGray),
            Text(
              label,
              style: TextStyles.font28lightGrayMedium.copyWith(
                  color: controller.currentIndex == page
                      ? ColorsManager.blue
                      : ColorsManager.lightGray),
            )
          ],
        ),
      ),
    );
  }
}
