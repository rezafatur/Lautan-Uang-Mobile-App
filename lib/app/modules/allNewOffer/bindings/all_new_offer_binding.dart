import 'package:get/get.dart';
import '../controllers/all_new_offer_controller.dart';

class AllNewOfferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllNewOfferController>(
      () => AllNewOfferController(),
    );
  }
}
