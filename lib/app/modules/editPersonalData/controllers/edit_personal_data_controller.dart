import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditPersonalDataController extends GetxController {
  // Pilih Tanggal Lahir
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final dateFormatter = DateFormat('yyyy-MM-dd');

  // Pilih Jenis Kelamin
  String? selectedGender;

  // Pilih Bank
  String? selectedBank;

  //TODO: Implement EditPersonalDataController

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
