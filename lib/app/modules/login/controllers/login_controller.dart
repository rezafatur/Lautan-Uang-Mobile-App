import 'package:get/get.dart';
import '../service/api_service.dart';
import '../../../data/models/local_storage_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var showPassword = true.obs;
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  bool isEmailValid(String email) {
    return email.isNotEmpty;
  }

  bool isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      var response = await ApiService().loginUser(email, password);
      if (response['success'] == true) {
        // Jika Berhasil Login, Maka Simpan Token di Shared Preference
        var token = response['token'];
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
