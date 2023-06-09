import 'package:get/get.dart';
import '../controllers/edit_personal_data_controller.dart';

class EditPersonalDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPersonalDataController>(
      () => EditPersonalDataController(),
    );
  }
}
