import 'package:get/get.dart';
import '../../../data/services/api_service.dart';
import '../../../data/models/local_storage_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var showPassword = true.obs;
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      var response = await ApiService().loginUser(email, password);
      if (response['success'] == true && response['access_token'] != null) {
        // Jika Berhasil Login, Maka Simpan Token di Shared Preference
        var token = response['access_token'];
        await _localStorageService.setToken(token);

        // Pindah ke Halaman Home
        Get.offNamed('/home');
      } else {
        // Jika Terjadi Kesalahan, Tampilkan Pesan Error
        var message = "Email atau Password Salah";
        errorMessage.value = message;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
