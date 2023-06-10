import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lautan_uang/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  void logoutUser() {
    // Hapus token dari GetStorage
    final storage = GetStorage();
    storage.remove('token');

    // Pindah ke Halaman Login
    Get.offAllNamed(Routes.LOGIN);
  }
}
