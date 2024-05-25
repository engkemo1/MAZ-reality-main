import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/setting_screen/data/models/user_response.dart';
import 'home_app.dart';

SharedPreferences? prefs;
UserInfoResponse? USER_DATA;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(HomeApp(
    appRouter: AppRouter(),
  ));
  prefs = await SharedPreferences.getInstance();
}
