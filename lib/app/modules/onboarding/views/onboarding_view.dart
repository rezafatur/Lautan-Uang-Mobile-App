import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lautan_uang/app/data/models/onboarding_data.dart';
import 'package:lautan_uang/app/modules/login/views/login_view.dart';
import 'package:lautan_uang/app/widgets/onboarding_nav_button.dart';
import 'package:lautan_uang/app/widgets/onboarding_text_button.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({Key? key}) : super(key: key);

  final pageController = PageController();
  @override
  final OnboardingController controller = Get.put(OnboardingController());

  // Dot atau Indikator Titik
  AnimatedContainer dotIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 12,
      width: 12,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isActive ? AzureishWhiteColor : MaximumBlueColor,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    // ignore: unused_local_variable
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      // Warna Latar Belakang Onboarding Screen
      backgroundColor: PrussianBlueColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header, Gambar, dan Deskripsi Onboarding
            Expanded(
              flex: 10,
              child: PageView.builder(
                controller: pageController,
                itemCount: OnboardingContents.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: sizeH * 0.05,
                    ),

                    // Header Onboarding Sesuai Tema
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        OnboardingContents[index].title,
                        style: textLargeAzureWhiteBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: sizeH * 0.05,
                    ),

                    // Gambar Onboarding Sesuai Tema
                    SizedBox(
                      height: sizeH * 0.5,
                      child: Image.asset(
                        OnboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: sizeH * 0.05,
                    ),

                    // Deskripsi Onboarding Sesuai Tema
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: Text(
                        OnboardingContents[index].description,
                        style: textSmallAzureWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: sizeH * 0.05,
                    ),
                  ],
                ),
              ),
            ),

            // Button atau Tombol "Lewati", "Lanjut", dan "Mulai Sekarang"
            Expanded(
              flex: 1,
              child: Obx(
                () => Column(
                  children: [
                    controller.currentPage.value ==
                            OnboardingContents.length - 1
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: onboardTextButton(
                                buttonName: "Mulai Sekarang",
                                onPressed: () {
                                  Get.offAll(
                                    LoginView(),
                                  );
                                },
                                backgroundColor: MaximumBlueColor),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                onboardNavButton(
                                  name: "Lewati",
                                  onPressed: () {
                                    pageController.animateToPage(
                                        OnboardingContents.length - 1,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.easeInOut);
                                  },
                                ),
                                Row(
                                  children: List.generate(
                                    OnboardingContents.length,
                                    (index) => dotIndicator(
                                        index == controller.currentPage.value),
                                  ),
                                ),
                                onboardNavButton(
                                  name: "Lanjut",
                                  onPressed: () {
                                    pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                  },
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
