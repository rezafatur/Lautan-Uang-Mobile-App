import 'package:get/get.dart';
import '../service/api_service.dart';
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
      if (response != null && response['success'] == true) {
        // Jika berhasil login, maka simpan token di shared preference
        var token = response['token'];
        await LocalStorageService().setToken(token);
        // Pindah ke halaman home
        Get.offNamed('/home');
      } else {
        // Jika terjadi kesalahan
        var message = response['message'] ?? 'Failed to login';
        errorMessage.value = message;
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
