import 'package:get/get.dart';

class FishermanDetailController extends GetxController {
  // Buat sebuah variabel observabel untuk menyimpan data kategori
  var selectedCategory = "Statistik".obs;

  // Buat method untuk mengubah kategori yang dipilih
  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  //TODO: Implement FishermanDetailController

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
