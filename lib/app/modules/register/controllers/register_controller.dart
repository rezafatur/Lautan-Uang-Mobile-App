import 'package:get/get.dart';
import 'package:lautan_uang/app/routes/app_pages.dart';
import '../../../data/models/user.dart';
import '../../../data/services/api_service.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var showPassword = true.obs;
  var showConfirmPassword = true.obs;
  var user = User(name: '', email: '', password: '', confirmPassword: '').obs;

  Future<void> registerUser(String name, String email, String password,
      String confirmPassword) async {
    try {
      isLoading.value = true;
      var response = await ApiService()
          .registerUser(name, email, password, confirmPassword);
      print(response);
      if (response['success'] == true && response['access_token'] != null) {
        // Jika berhasil register, alihkan ke halaman login
        Get.offNamed(Routes.LOGIN);

        // ignore: unnecessary_null_comparison
      } else if (response != null && response['error'] != null) {
        // Jika Terjadi Kesalahan, Tampilkan Pesan Error
        Map<String, dynamic> errors = response['error'];
        String message = '';
        errors.forEach(
          (key, value) {
            message += value[0] + '\n';
          },
        );
        errorMessage.value = message;
      }
    } catch (e) {
      // Jika Terjadi Kesalahan, Tampilkan Pesan Error
      errorMessage.value = "Gagal mendaftarkan pengguna";
    } finally {
      isLoading.value = false;
    }
  }
}
