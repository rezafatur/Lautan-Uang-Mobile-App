import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lautan_uang/app/routes/app_pages.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../controllers/page_index_controller.dart';
import '../../../data/models/dummy_Saldo.dart';
import '../controllers/balance_controller.dart';

class BalanceView extends GetView<BalanceController> {
  BalanceView({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1 - Profile
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
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/profile.png",
                      height: sizeH * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Investor",
                            style: textMediumWhiteBold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offNamed('profile');
                            },
                            child: Text(
                              "View Profile",
                              style: textSmallWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Section 2 - Kartu Saldo, Tarik, dan Deposit
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: sizeW,
                height: sizeH * 0.225,
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Saldo",
                              style: textSmallBlack,
                            ),
                            Text(
                              "Rp10.000.000",
                              style: textLargeBlackBold,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: sizeW,
                        height: 0.25,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Get.offAllNamed(Routes.WITHDRAWAL);
                              },
                              child: Text(
                                "Tarik",
                                style: textLargeBlack,
                                textAlign: TextAlign.center,
                              ),
                            )),
                            Container(
                              width: 0.25,
                              height: sizeH,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Get.offAllNamed(Routes.DEPOSIT);
                              },
                              child: Text(
                                "Deposito",
                                style: textLargeBlack,
                                textAlign: TextAlign.center,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Section 3 - Riwayat
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Riwayat",
                style: textMediumBlackBold,
              ),
            ),
            SizedBox(
              height: sizeH * 0.99,
              child: Column(
                children: saldoContents.isEmpty
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
                                  "Belum Ada Riwayat",
                                  style: textLargeBlackBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    : saldoContents.map(
                        (content) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        // Hari, Tanggal, dan Jenis Saldo
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                content.tanggalSaldo,
                                                style: textSmallBlack,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                content.jenisSaldo,
                                                style: textSmallBlackBold,
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Status Saldo dan Total Saldo
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                content.statusSaldo,
                                                style: textSmallBlack,
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
                                                  content.totalSaldo,
                                                ),
                                                style: textSmallBlackBold,
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
