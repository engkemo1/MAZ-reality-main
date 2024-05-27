import 'dart:io';

import 'package:final_project/core/di/dependencey_injection.dart';
import 'package:final_project/core/routing/app_router.dart';
import 'package:final_project/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'features/setting_screen/data/models/user_response.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'home_app.dart';

SharedPreferences? prefs;
UserInfoResponse? USER_DATA;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

ChatCubit().fetchChats();
  runApp(HomeApp(
    appRouter: AppRouter(),
  ));
  prefs = await SharedPreferences.getInstance();
}
