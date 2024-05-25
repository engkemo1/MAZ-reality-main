import 'package:dio/dio.dart';
import 'package:final_project/core/networking/api_services.dart';
import 'package:final_project/core/networking/dio_factory.dart';
import 'package:final_project/features/add_post_screen/logic/add_property_cubit.dart';
import 'package:final_project/features/cities/data/repo/cities_repo.dart';
import 'package:final_project/features/cities/logic/cities_cubit.dart';
import 'package:final_project/features/details/logic/details_cubit.dart';
import 'package:final_project/features/edit_profile/data/repo/update_repo.dart';
import 'package:final_project/features/edit_profile/logic/update_profile_cubit.dart';
import 'package:final_project/features/favorite/logic/favorites_cubit.dart';
import 'package:final_project/features/home_details/data/repo/home_repo.dart';
import 'package:final_project/features/home_details/logic/home_cubit.dart';
import 'package:final_project/features/login/data/repos/login_repo.dart';
import 'package:final_project/features/login/logic/cubit/login_cubit.dart';
import 'package:final_project/features/my_ads/data/repo/my_ads_repo.dart';
import 'package:final_project/features/my_ads/logic/my_ads_cubit.dart';
import 'package:final_project/features/setting_screen/data/repos/user_repo.dart';
import 'package:final_project/features/setting_screen/logic/cubit/user_cubit.dart';
import 'package:final_project/features/signup/data/repos/signup_repo.dart';
import 'package:final_project/features/signup/logic/cubit/signup_cubit.dart';
import 'package:final_project/features_admin/admin/home/data/admin_home_repo.dart';
import 'package:final_project/features_admin/admin/home/logic/admin_home_cubit.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer_details/data/repo/approve_property_repo.dart';
import 'package:final_project/features_admin/lawyer_page/lawyer_details/logic/approve_property_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/add_post_screen/data/repo/add_property_repo.dart';
import '../../features/favorite/data/repo/my_favorites_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiServices
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

//  profile
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt()));
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(getIt()));
  getIt.registerLazySingleton<UpdateProfileCubit>(() => UpdateProfileCubit(getIt()));
  getIt.registerLazySingleton<UpdateRepo>(() => UpdateRepo(getIt()));

  //home
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<HomeRepo>(() => HomeRepo(getIt()));

  getIt.registerLazySingleton<MyAdsCubit>(() => MyAdsCubit(getIt()));
  getIt.registerLazySingleton<MyAdsRepo>(() => MyAdsRepo(getIt()));

  getIt.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit(getIt()));
  getIt.registerLazySingleton<MyFavoritesRepo>(() => MyFavoritesRepo(getIt()));

  getIt.registerFactory<AddPropertyCubit>(() => AddPropertyCubit(getIt()));
  getIt.registerFactory<AddPropertyRepo>(() => AddPropertyRepo(getIt()));


  getIt.registerFactory<AdminHomeCubit>(() => AdminHomeCubit(getIt()));
  getIt.registerFactory<AdminHomeRepo>(() => AdminHomeRepo(getIt()));

  getIt.registerFactory<ApprovePropertyCubit>(() => ApprovePropertyCubit(getIt()));
  getIt.registerFactory<ApprovePropertyRepo>(() => ApprovePropertyRepo(getIt()));

  getIt.registerFactory<CitiesCubit>(() => CitiesCubit(getIt()));
  getIt.registerFactory<CitiesRepo>(() => CitiesRepo(getIt()));

  getIt.registerFactory<DetailsCubit>(() => DetailsCubit(getIt()));

}
