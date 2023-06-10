import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../routes/app_pages.dart';
import '../controllers/withdrawal_controller.dart';

class WithdrawalView extends GetView<WithdrawalController> {
  const WithdrawalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    // Format angka jumlah penarikan
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
          "Tarik",
          style: textLargeBlackBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Saldo Anda
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                width: sizeW,
                height: sizeH * 0.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PrussianBlueColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saldo Anda",
                        style: textSmallWhite,
                      ),
                      Text(
                        "Rp1.500.000",
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

            // Textfield Jumlah yang ingin ditarik
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Jumlah Penarikan",
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
            const SizedBox(
              height: 20,
            ),

            // Textfield Bank
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Bank",
                    style: textSmallBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: controller.selectedBank != null
                          ? "Pilih Bank"
                          : "Pilih Bank",
                      hintStyle: textNormal,
                    ),
                    value: controller.selectedBank,
                    items: const [
                      DropdownMenuItem(
                        value: "BCA",
                        child: Text(
                          "BCA",
                          style: textBold,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "BNI",
                        child: Text(
                          "BNI",
                          style: textBold,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Mandiri",
                        child: Text(
                          "Mandiri",
                          style: textBold,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      controller.selectedBank = value!;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Nomor Rekening
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Nomor Rekening",
                    style: textSmallBlack,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Nomor Rekening",
                      hintStyle: textNormal,
                    ),
                    style: textBold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Nama Pemilik
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Nama Pemilik",
                    style: textSmallBlack,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Nama Pemilik",
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
              Get.offAllNamed(Routes.BALANCE);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MaximumBlueColor,
            ),
            child: Text(
              'Tarik Sekarang',
              style: textSmallWhite,
            ),
          ),
        ),
      ),
    );
  }
}
