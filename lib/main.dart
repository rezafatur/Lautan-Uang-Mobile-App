import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
import 'app/data/models/local_storage_service.dart';

bool? seenOnboard;

void main() async {
  await GetStorage.init(); // initialize GetStorage
  Get.put(LocalStorageService()); // register LocalStorageService
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
