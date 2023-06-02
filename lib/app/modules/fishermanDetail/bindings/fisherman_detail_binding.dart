import 'package:get/get.dart';

import '../controllers/fisherman_detail_controller.dart';

class FishermanDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FishermanDetailController>(
      () => FishermanDetailController(),
    );
  }
}
