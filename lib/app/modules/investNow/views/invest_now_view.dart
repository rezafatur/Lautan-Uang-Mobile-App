import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../controllers/page_index_controller.dart';
import '../controllers/invest_now_controller.dart';

class InvestNowView extends GetView<InvestNowController> {
  InvestNowView({Key? key}) : super(key: key);

  // Page Controller untuk Home, Portofolio, Transaksi, dan Saldo
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // ignore: unused_local_variable
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      // Navigasi Bagian Atas
      // Navigasi Bagian Atas
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Pembayaran",
          style: textLargeBlackBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Total Dana Yang Didapat, Target Pendanaan, dan Tersedia Slot
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                width: sizeW,
                height: sizeH * 0.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: PrussianBlueColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Total Dana Yang Didapat
                      Text(
                        "Total Dana Yang Didapat",
                        style: textSmallWhite,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rp 500.000.000",
                        style: textExtraLargeWhiteBold,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Target Pendanaan
                      Text(
                        "Target Pendanaan",
                        style: textSmallWhite,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rp 1.000.000.000",
                        style: textExtraLargeWhiteBold,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Tersedia Slot
                      Text(
                        "Tersedia Slot",
                        style: textSmallWhite,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "5",
                        style: textExtraLargeWhiteBold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Investasi Sekarang
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  // Header
                  Text(
                    "Investasi Sekarang",
                    style: textMediumBlackBold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Button atau Tombol "200ribu" dan "400ribu"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 200ribu
                      Expanded(
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.count.value = 1;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.count.value == 1
                                    ? PrussianBlueColor
                                    : Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: Text(
                                "200ribu",
                                style: controller.count.value == 1
                                    ? textExtraLargeWhiteNormal
                                    : textExtraLargeBlackNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),

                      // 400ribu
                      Expanded(
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.count.value = 2;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.count.value == 2
                                    ? PrussianBlueColor
                                    : Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: Text(
                                "400ribu",
                                style: controller.count.value == 2
                                    ? textExtraLargeWhiteNormal
                                    : textExtraLargeBlackNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Button atau Tombol "600ribu" dan "800ribu"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 600ribu
                      Expanded(
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.count.value = 3;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.count.value == 3
                                    ? PrussianBlueColor
                                    : Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: Text(
                                "600ribu",
                                style: controller.count.value == 3
                                    ? textExtraLargeWhiteNormal
                                    : textExtraLargeBlackNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),

                      // 800ribu
                      Expanded(
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.count.value = 4;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.count.value == 4
                                    ? PrussianBlueColor
                                    : Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: Text(
                                "800ribu",
                                style: controller.count.value == 4
                                    ? textExtraLargeWhiteNormal
                                    : textExtraLargeBlackNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Button atau Tombol "1juta" dan "2juta"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 1juta
                      Expanded(
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.count.value = 5;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.count.value == 5
                                    ? PrussianBlueColor
                                    : Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: Text(
                                "1juta",
                                style: controller.count.value == 5
                                    ? textExtraLargeWhiteNormal
                                    : textExtraLargeBlackNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),

                      // 2juta
                      Expanded(
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.count.value = 6;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.count.value == 6
                                    ? PrussianBlueColor
                                    : Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: Text(
                                "2juta",
                                style: controller.count.value == 6
                                    ? textExtraLargeWhiteNormal
                                    : textExtraLargeBlackNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Button atau Tombol "5juta" dan "10juta"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 5juta
                      Expanded(
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.count.value = 7;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.count.value == 7
                                    ? PrussianBlueColor
                                    : Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: Text(
                                "5juta",
                                style: controller.count.value == 7
                                    ? textExtraLargeWhiteNormal
                                    : textExtraLargeBlackNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),

                      // 10juta
                      Expanded(
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.count.value = 8;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.count.value == 8
                                    ? PrussianBlueColor
                                    : Colors.white,
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: Text(
                                "10juta",
                                style: controller.count.value == 8
                                    ? textExtraLargeWhiteNormal
                                    : textExtraLargeBlackNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // Warna Background atau Latar Belakang
      backgroundColor: Colors.white,

      // Button atau Tombol "Tarik Sekarang"
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: SizedBox(
          width: sizeW,
          child: ElevatedButton(
            onPressed: () {
              pageC.changePage(0);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MaximumBlueColor,
            ),
            child: Text(
              'Bayar Sekarang',
              style: textSmallWhite,
            ),
          ),
        ),
      ),
    );
  }
}
