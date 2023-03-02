import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(
    GetMaterialApp(
      title: "Lautan Uang",
      debugShowCheckedModeBanner: false,
      initialRoute: isFirstTime ? Routes.ONBOARDING : Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
