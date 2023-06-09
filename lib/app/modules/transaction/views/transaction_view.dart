import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lautan_uang/app/controllers/page_index_controller.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../data/models/dummy_Transaksi.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  TransactionView({Key? key}) : super(key: key);

  // Page Controller untuk Home, Portofolio, Transaksi, dan Saldo
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      // Navigasi Bagian Atas
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            "Lautan Uang",
            style: textLargePrussianBlueBold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: InkWell(
              onTap: () {
                Get.offNamed('profile');
              },
              child: const SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.account_circle_rounded,
                  color: PrussianBlueColor,
                ),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section 1 - Transaksi
            Container(
              width: sizeW,
              height: sizeH * 0.163,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: PrussianBlueColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaksi",
                      style: textLargeWhiteBold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sedang Proses",
                              style: textSmallWhite,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "2",
                              style: textLargeWhiteBold,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Berhasil",
                              style: textSmallWhite,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "5",
                              style: textLargeWhiteBold,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gagal",
                              style: textSmallWhite,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "0",
                              style: textLargeWhiteBold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Section 2 - List Transaksi
            SizedBox(
              height: sizeH * 0.99,
              child: Column(
                children: transaksiContents.isEmpty
                    ? [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Container(
                            width: sizeW,
                            height: sizeH * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  "Belum Ada Transaksi",
                                  style: textLargeBlackBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    : transaksiContents.map(
                        (content) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: sizeH * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0,
                                            0), // Mengatur posisi bayangan (x, y)
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        // Tim Nelayan dan Total Portofolio
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                content.fishermanTeam,
                                                style: textSmallBlackBold,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                NumberFormat.currency(
                                                  locale: 'id',
                                                  decimalDigits: 0,
                                                  symbol: 'Rp',
                                                ).format(
                                                  content.totalPortfolio,
                                                ),
                                                style: textSmallBlack,
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Status
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            content.status,
                                            style: textSmallBlackBold,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
              ),
            ),
          ],
        ),
      ),
      // Warna Background atau Latar Belakang
      backgroundColor: Colors.white,

      // Tombol Navigasi Bagian Bawah
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        backgroundColor: PrussianBlueColor,
        items: [
          TabItem(
            icon: Image.asset("assets/icons/home.png"),
            title: "Home",
          ),
          TabItem(
            icon: Image.asset("assets/icons/portfolio.png"),
            title: "Portofolio",
          ),
          TabItem(
            icon: Image.asset("assets/icons/transaction.png"),
            title: "Transaksi",
          ),
          TabItem(
            icon: Image.asset("assets/icons/wallet.png"),
            title: "Saldo",
          ),
        ],
        initialActiveIndex: pageC.pageIndex.value,
        onTap: (int i) => pageC.changePage(i),
      ),
    );
  }
}
