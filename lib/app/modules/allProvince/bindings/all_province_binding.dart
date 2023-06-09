import 'package:get/get.dart';
import '../controllers/all_province_controller.dart';

class AllProvinceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProvinceController>(
      () => AllProvinceController(),
    );
  }
}
