import 'package:get/get.dart';
import '../../../controllers/page_index_controller.dart';
import '../../../data/services/api_service.dart';
import '../../../data/models/local_storage_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var showPassword = true.obs;
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  // Page Controller untuk Home, Portofolio, Transaksi, dan Saldo
  final pageC = Get.find<PageIndexController>();

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      var response = await ApiService().loginUser(email, password);
      if (response['success'] == true && response['access_token'] != null) {
        // Jika Berhasil Login, Maka Simpan Token di Shared Preference
        var token = response['access_token'];
        await _localStorageService.setToken(token);

        // Pindah ke Halaman Home
        pageC.changePage(0);
      } else {
        // Jika Terjadi Kesalahan, Tampilkan Pesan Error
        errorMessage.value = "Email atau Password Salah";
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
