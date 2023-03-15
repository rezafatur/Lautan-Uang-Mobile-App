import 'package:get/get.dart';
import 'package:lautan_uang/app/routes/app_pages.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int i) async {
    switch (i) {
      case 1:
        pageIndex.value = i;
        Get.offAllNamed(Routes.PORTFOLIO);
        break;
      case 2:
        pageIndex.value = i;
        Get.offAllNamed(Routes.BALANCE);
        break;
      case 3:
        pageIndex.value = i;
        Get.offAllNamed(Routes.TRANSACTION);
        break;
      default:
        pageIndex.value = i;
        Get.offAllNamed(Routes.HOME);
    }
  }
}
