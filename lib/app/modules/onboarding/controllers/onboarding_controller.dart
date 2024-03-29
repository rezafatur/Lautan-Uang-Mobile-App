import 'package:get/get.dart';
import 'package:lautan_uang/app/data/models/onboarding_data.dart';
import 'package:lautan_uang/app/modules/login/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    checkFirstTime();
  }

  void checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (!isFirstTime) {
      Get.off(LoginView());
    }
  }

  Future<void> onPageChanged(int index) async {
    currentPage.value = index;

    if (index == OnboardingContents.length - 1) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isFirstTime', false);
    }
  }
}
