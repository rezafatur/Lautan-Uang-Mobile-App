import 'package:get/get.dart';
import '../service/api_service.dart';
import '../../../data/models/user.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var user = User(name: '', email: '', password: '').obs;
  var errorMessage = ''.obs;
  var showPassword = true.obs;

  Future<void> registerUser(String name, String email, String password) async {
    try {
      isLoading.value = true;
      var response = await ApiService().registerUser(name, email, password);
      print(response);
      if (response['message'] != null && response['errors'] == null) {
        errorMessage.value = response['message'];
        // Jika berhasil register, alihkan ke halaman login
        Get.offNamed('/login');
        // ignore: unnecessary_null_comparison
      } else if (response != null && response['errors'] != null) {
        // Jika terjadi kesalahan
        Map<String, dynamic> errors = response['errors'];
        String message = '';
        errors.forEach((key, value) {
          message += value[0] + '\n';
        });
        errorMessage.value = message;
      }
    } catch (e) {
      errorMessage.value = 'Failed to register user';
    } finally {
      isLoading.value = false;
    }
  }
}
