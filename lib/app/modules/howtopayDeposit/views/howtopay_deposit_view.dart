import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../controllers/page_index_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/howtopay_deposit_controller.dart';

class HowtopayDepositView extends GetView<HowtopayDepositController> {
  HowtopayDepositView({Key? key}) : super(key: key);

  // Page Controller untuk Home, Portofolio, Transaksi, dan Saldo
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    Get.put(HowtopayDepositController());
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

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
            Get.offAllNamed(Routes.DEPOSIT);
          },
        ),
        title: Text(
          "Cara Bayar",
          style: textLargeBlackBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              // Batas waktu pembayaran
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bayar Sebelum",
                    style: textMediumBlackBold,
                  ),
                  Text(
                    "12 jam 50 menit 12 detik",
                    style: textMediumBlackBold,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // Total Pembayaran
              Container(
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
                        "Total Pembayaran",
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
              const SizedBox(
                height: 20,
              ),

              // Transfer Bank
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transfer Bank",
                  style: textMediumBlackBold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Kumpulan Kategori Bank (BCA, BNI, dan Mandiri)
              Column(
                children: [
                  // Kategori BCA
                  Obx(
                    () => Container(
                      width: sizeW,
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
                          if (controller.selectedCategory.value == "BCA") {
                            controller.changeCategory("");
                          } else {
                            controller.changeCategory("BCA");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "BCA",
                                    style: textMediumBlackBold,
                                  ),
                                ),
                                Icon(
                                  controller.selectedCategory.value == "BCA"
                                      ? Icons.arrow_drop_up_rounded
                                      : Icons.arrow_drop_down_rounded,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            if (controller.selectedCategory.value == "BCA")
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Nomor 1
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "1. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text: "Masuk ke aplikasi ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text: "m-BCA",
                                                    style: textSmallBlackBold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 2
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "2. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text: "Masuk ke menu ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "M-TRANSFER > BCA VIRTUAL ACCOUNT",
                                                    style: textSmallBlackBold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 3
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "3. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text: "Masukkan ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text: "148323123122322 ",
                                                    style: textSmallBlackBold,
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "sebagai nomor rekening tujuan",
                                                    style: textSmallGrey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 4
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "4. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text(
                                              "Masukkan jumlah penambahan dana yang diinginkan",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 5
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "5. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text: "Masukkan ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text: "PIN m-BCA ",
                                                    style: textSmallBlackBold,
                                                  ),
                                                  TextSpan(
                                                    text: "Anda",
                                                    style: textSmallGrey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 6
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "6. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text(
                                              "Ikuti petunjuk untuk menyelesaikan transaksi",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Kategori BNI
                  Obx(
                    () => Container(
                      width: sizeW,
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
                          if (controller.selectedCategory.value == "BNI") {
                            controller.changeCategory("");
                          } else {
                            controller.changeCategory("BNI");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "BNI",
                                    style: textMediumBlackBold,
                                  ),
                                ),
                                Icon(
                                  controller.selectedCategory.value == "BNI"
                                      ? Icons.arrow_drop_up_rounded
                                      : Icons.arrow_drop_down_rounded,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            if (controller.selectedCategory.value == "BNI")
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Nomor 1
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "1. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text: "Masuk ke aplikasi ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text: "BNI Mobile Banking",
                                                    style: textSmallBlackBold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 2
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "2. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text: "Masuk ke ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "TRANSFER > VIRTUAL ACCOUNT BILLING",
                                                    style: textSmallBlackBold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 3
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "3. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text:
                                                    "Pilih tab \"Input Baru\". Lalu, ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text: "148323123122322",
                                                    style: textSmallBlackBold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 4
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "4. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text:
                                                    "Masukkan jumlah penambahan dan yang diinginkan pada kolom \"Nominal\". Lalu, ketuk ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text: "\"Lanjut\"",
                                                    style: textSmallBlackBold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 5
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "5. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text(
                                              "Konfirmasi transaksi Anda dengan memasukkan kata sandi mobile banking Anda",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Kategori Mandiri
                  Obx(
                    () => Container(
                      width: sizeW,
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
                          if (controller.selectedCategory.value == "Mandiri") {
                            controller.changeCategory("");
                          } else {
                            controller.changeCategory("Mandiri");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Mandiri",
                                    style: textMediumBlackBold,
                                  ),
                                ),
                                Icon(
                                  controller.selectedCategory.value == "Mandiri"
                                      ? Icons.arrow_drop_up_rounded
                                      : Icons.arrow_drop_down_rounded,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            if (controller.selectedCategory.value == "Mandiri")
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Nomor 1
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "1. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text(
                                              "Masuk ke Livin' dengan Aplikasi Mandiri",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 2
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "2. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text: "Masuk ke menu ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        "Payments > Make New Payment > Multi Payment",
                                                    style: textSmallBlackBold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 3
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "3. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text.rich(
                                              TextSpan(
                                                text:
                                                    "Pilih sumber dana Anda di kolom \"Sumber Dana\". Kemudian, pilih LautanUangtopup sebagai \"Service Provider\", masukkan ",
                                                style: textSmallGrey,
                                                children: [
                                                  TextSpan(
                                                    text: "148323123122322 ",
                                                    style: textSmallBlackBold,
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "pada kolom \"No VA\" lalu klik \"Add As New Payee\". Kemudian, masukkan jumlah penambahan dana yang diinginkan lalu klik \"Lanjutkan\"",
                                                    style: textSmallGrey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Nomor 4
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "4. ",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 15,
                                            child: Text(
                                              "Konfirmasi transaksi dengan memasukkan Livin' by Mandiri PIN",
                                              style: textSmallGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      // Warna Background atau Latar Belakang
      backgroundColor: Colors.white,

      // Button atau Tombol "Kembali ke Home"
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
              'Kembali ke Home',
              style: textSmallWhite,
            ),
          ),
        ),
      ),
    );
  }
}
