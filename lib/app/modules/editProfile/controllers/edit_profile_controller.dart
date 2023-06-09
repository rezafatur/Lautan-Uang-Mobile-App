import 'package:get/get.dart';

class EditProfileController extends GetxController {
  // Pilih Jenis Kelamin
  String? selectedGender;

  // Menampilkan Kata Sandi Baru atau Tidak
  var showNewPassword = true.obs;

  // Menampilkan Konfirmasi Kata Sandi Baru atau Tidak
  var showConfirmationNewPassword = true.obs;

  //TODO: Implement EditProfileController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
