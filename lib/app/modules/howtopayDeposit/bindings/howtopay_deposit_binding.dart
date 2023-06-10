import 'package:get/get.dart';
import '../controllers/howtopay_deposit_controller.dart';

class HowtopayDepositBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HowtopayDepositController>(
      () => HowtopayDepositController(),
    );
  }
}
