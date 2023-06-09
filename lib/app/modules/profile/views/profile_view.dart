import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lautan_uang/app/modules/editPersonalData/views/edit_personal_data_view.dart';
import 'package:lautan_uang/app/modules/editProfile/views/edit_profile_view.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../controllers/page_index_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  // Page Controller untuk Home, Portofolio, Transaksi, dan Saldo
  final pageC = Get.find<PageIndexController>();

  // Konfirmasi Keluar Akun
  void showLogoutConfirmation(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Apakah Anda yakin ingin keluar dari akun Anda?",
                  textAlign: TextAlign.center,
                  style: textLargeBlackBold,
                ),
                SizedBox(
                  height: sizeH * 0.025,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AzureishWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Tidak",
                              style: textMediumBlack,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: sizeW * 0.05,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.offNamed('login');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AzureishWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Ya",
                              style: textMediumBlackBold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
        title: Center(
          child: Text(
            "Profil",
            style: textLargeBlackBold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Icon
            const Center(
              child: Icon(
                Icons.account_circle_rounded,
                color: PrussianBlueColor,
                size: 150,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Nama dan Email Investor
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Investor",
                  style: textLargeBlackBold,
                ),
                Text(
                  "investor@gmail.com",
                  style: textSmallBlack,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Menu Umum
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategori Umum
                  Text(
                    "Umum",
                    style: textMediumBlackBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Menu Home, Portofolio, Transaksi, dan Saldo
                  Container(
                    width: sizeW,
                    height: sizeH * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AzureishWhiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Home atau Halaman Utama
                          InkWell(
                            onTap: () {
                              pageC.changePage(0);
                            },
                            child: SizedBox(
                              width: sizeW,
                              height: 35,
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: PrussianBlueColor,
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Image.asset(
                                        "assets/icons/home.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Home",
                                    style: textMediumBlack,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // Portofolio
                          InkWell(
                            onTap: () {
                              pageC.changePage(1);
                            },
                            child: SizedBox(
                              width: sizeW,
                              height: 35,
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: PrussianBlueColor,
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Image.asset(
                                        "assets/icons/portfolio.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Portofolio",
                                    style: textMediumBlack,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // Transaksi
                          InkWell(
                            onTap: () {
                              pageC.changePage(2);
                            },
                            child: SizedBox(
                              width: sizeW,
                              height: 35,
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: PrussianBlueColor,
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Image.asset(
                                        "assets/icons/transaction.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Transaksi",
                                    style: textMediumBlack,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // Saldo
                          InkWell(
                            onTap: () {
                              pageC.changePage(3);
                            },
                            child: SizedBox(
                              width: sizeW,
                              height: 35,
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: PrussianBlueColor,
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Image.asset(
                                        "assets/icons/wallet.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Saldo",
                                    style: textMediumBlack,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Menu Akun
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategori Akun
                  Text(
                    "Akun",
                    style: textMediumBlackBold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Menu Edit Profil, Edit Data Diri, dan Keluar Akun
                  Container(
                    width: sizeW,
                    height: sizeH * 0.23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AzureishWhiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Edit Profil
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfileView()),
                              );
                            },
                            child: SizedBox(
                              width: sizeW,
                              height: 35,
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: PrussianBlueColor,
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Image.asset(
                                        "assets/icons/EditProfile.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Edit profil",
                                    style: textMediumBlack,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // Edit Data Diri
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditPersonalDataView()),
                              );
                            },
                            child: SizedBox(
                              width: sizeW,
                              height: 35,
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: PrussianBlueColor,
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Image.asset(
                                        "assets/icons/EditPersonalData.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Edit Personal Data",
                                    style: textMediumBlack,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // Keluar Akun
                          InkWell(
                            onTap: () {
                              showLogoutConfirmation(context);
                            },
                            child: SizedBox(
                              width: sizeW,
                              height: 35,
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: PrussianBlueColor,
                                    ),
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: Image.asset(
                                        "assets/icons/Logout.png",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Keluar Akun",
                                    style: textMediumBlack,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),

            // Lautan Uang
            Center(
              child: Text(
                "Lautan Uang",
                style: textLargePrussianBlueBold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // Warna Latar Belakang Halaman
      backgroundColor: Colors.white,
    );
  }
}
