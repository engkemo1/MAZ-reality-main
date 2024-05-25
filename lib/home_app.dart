import 'package:final_project/core/routing/app_router.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/theming/colors.dart';
import 'package:final_project/features/add_post_screen/logic/add_property_cubit.dart';
import 'package:final_project/features/cities/logic/cities_cubit.dart';
import 'package:final_project/features/details/logic/details_cubit.dart';
import 'package:final_project/features/edit_profile/logic/update_profile_cubit.dart';
import 'package:final_project/features/favorite/logic/favorites_cubit.dart';
import 'package:final_project/features/home_details/logic/home_cubit.dart';
import 'package:final_project/features/login/logic/cubit/login_cubit.dart';
import 'package:final_project/features/setting_screen/logic/cubit/user_cubit.dart';
import 'package:final_project/features_admin/admin/home/logic/admin_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependencey_injection.dart';

class HomeApp extends StatelessWidget {
  final AppRouter appRouter;

  const HomeApp({super.key, required this.appRouter});

// we uzed screenutils  to fix the screen sizes and the reponsive (pakage flutter_screenutil: ^5.9.0)
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AdminHomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<FavoritesCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddPropertyCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UpdateProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<CitiesCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        //This is the size the designer was based on the designer that sent you figma or adobe xd
        // designSize: const Size(932.25, 432),
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'HomeApp',
          theme: ThemeData(
              primaryColor: ColorsManager.darkBlue,
              scaffoldBackgroundColor: Colors.white),
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.onBoardingScreen,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
