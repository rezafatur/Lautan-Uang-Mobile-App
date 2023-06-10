import 'package:get/get.dart';

class HowtopayDepositController extends GetxController {
  var selectedCategory = "".obs;

  // Metode untuk mengubah kategori yang dipilih
  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  //TODO: Implement HowtopayDepositController

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
