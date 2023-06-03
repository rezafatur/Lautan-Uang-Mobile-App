import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  // Pilih Tanggal Lahir
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final dateFormatter = DateFormat('yyyy-MM-dd');

  // Pilih Jenis Kelamin
  String? selectedGender;

  // Menampilkan Password atau Tidak
  var showPassword = true.obs;

  //TODO: Implement ProfileController

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
