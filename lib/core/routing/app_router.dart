import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/features/details/logic/details_cubit.dart';
import 'package:final_project/features/details/ui/details_screen.dart';
import 'package:final_project/features/edit_profile/ui/change_password_screen.dart';
import 'package:final_project/features/edit_profile/ui/edit_profile_screen.dart';
import 'package:final_project/features/favorite/ui/favorite_screen.dart';
import 'package:final_project/features/forget_pass/ui/forget_password_screen.dart';
import 'package:final_project/features/home/ui/home_screen.dart';
import 'package:final_project/features/home_details/data/models/home_properties_response.dart';
import 'package:final_project/features/home_details/logic/home_cubit.dart';
import 'package:final_project/features/home_details/ui/home_details.dart';
import 'package:final_project/features/login/logic/cubit/login_cubit.dart';
import 'package:final_project/features/login/ui/login_screen.dart';
import 'package:final_project/features/add_post_screen/ui/add_post_screen.dart';
import 'package:final_project/features/onboarding/onboarding_screen.dart';
import 'package:final_project/features/search/ui/search_screen.dart';
import 'package:final_project/features/setting_screen/logic/cubit/user_cubit.dart';
import 'package:final_project/features/setting_screen/ui/settings_screen.dart';
import 'package:final_project/features/signup/logic/cubit/signup_cubit.dart';
import 'package:final_project/features/signup/ui/signup_screen.dart';
import 'package:final_project/features_admin/admin/home/logic/admin_home_cubit.dart';
import 'package:final_project/features_admin/admin/ui/admin_screen.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer/ui/lawyer_screen.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer_details/logic/approve_property_cubit.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer_details/ui/lawyer_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this argument to be passed in any screen like this(arguments as className)
    // ignore: unused_local_variable
    final argument = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: const SignupScreen(),
                ));

      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<UserCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>(),
              ),
            ],
            child: HomeScreen(),
          ),
        );

      case Routes.homeDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeDetailsScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );

      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<DetailsCubit>(),
              child: const FavoriteScreen()),
        );

      case Routes.addPostScreen:
        return MaterialPageRoute(
          builder: (_) => AddPostScreen(),
        );

      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UserCubit>(),
            child: const SettingsScreen(),
          ),
        );

      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
      case Routes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),
        );

      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<DetailsCubit>(),
              child: DetailsScreen(property: settings.arguments as dynamic, isFilter:false,)),
        );
      //Lawyer And Admin
      case Routes.lawyerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => getIt<AdminHomeCubit>(),
                  child: const LawyerScreen(),
                ));

      case Routes.lawyerDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ApprovePropertyCubit>(),
            child: LawyerDetailsScreen(
              property: settings.arguments as Property,
            ),
          ),
        );

      case Routes.adminScreen:
        return MaterialPageRoute(
          builder: (_) => const AdminScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
