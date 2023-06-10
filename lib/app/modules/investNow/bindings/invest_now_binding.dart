import 'package:get/get.dart';
import '../controllers/invest_now_controller.dart';

class InvestNowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvestNowController>(
      () => InvestNowController(),
    );
  }
}
