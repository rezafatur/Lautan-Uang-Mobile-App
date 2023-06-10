import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lautan_uang/app/controllers/page_index_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
import 'app/data/models/local_storage_service.dart';

bool? seenOnboard;

void main() async {
  // Inisialisasi GetStorage untuk penggunaan local storage
  await GetStorage.init();

  // Menambahkan LocalStorageService ke GetX dependency injection
  Get.put(LocalStorageService());

  // Menambahkan PageIndexController ke GetX dependency injection (permanent: true agar tidak dihapus)
  Get.put(PageIndexController(), permanent: true);

  // Memastikan bahwa binding Flutter telah diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Mengatur tampilan sistem UI overlay (status bar) menjadi transparan
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // Menginisialisasi SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Memeriksa apakah ini kali pertama aplikasi dijalankan
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  // Mengambil Token
  var storage = GetStorage();
  var token = storage.read('token');
  String? storedToken = token;

  runApp(
    GetMaterialApp(
      title: "Lautan Uang",
      debugShowCheckedModeBanner: false,
      initialRoute: storedToken != null
          ? Routes.HOME
          : isFirstTime
              ? Routes.ONBOARDING
              : Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}
