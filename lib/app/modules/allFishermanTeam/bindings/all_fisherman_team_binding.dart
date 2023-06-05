import 'package:get/get.dart';
import '../controllers/all_fisherman_team_controller.dart';

class AllFishermanTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllFishermanTeamController>(
      () => AllFishermanTeamController(),
    );
  }
}
