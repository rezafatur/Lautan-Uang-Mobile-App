import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../routes/app_pages.dart';
import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // ignore: unused_local_variable
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    // Format angka nominal
    final currencyFormat = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    return Scaffold(
      // Navigasi Bagian Atas
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.BALANCE);
          },
        ),
        title: Text(
          "Deposit",
          style: textLargeBlackBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Jumlah Dana
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  // Header
                  Text(
                    "Jumlah Dana",
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

            // Textfield Nominal
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Nominal",
                    style: textSmallBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                          final parsedValue = int.tryParse(newValue.text);
                          if (parsedValue != null) {
                            final formattedValue =
                                currencyFormat.format(parsedValue);
                            return TextEditingValue(
                              text: formattedValue,
                              selection: TextSelection.collapsed(
                                  offset: formattedValue.length),
                            );
                          }
                          return newValue;
                        },
                      ),
                    ],
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Jumlah Penarikan",
                      hintStyle: textNormal,
                    ),
                    style: textBold,
                  ),
                ),
              ],
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
              Get.offAllNamed(Routes.HOWTOPAY_DEPOSIT);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MaximumBlueColor,
            ),
            child: Text(
              'Deposit Sekarang',
              style: textSmallWhite,
            ),
          ),
        ),
      ),
    );
  }
}
