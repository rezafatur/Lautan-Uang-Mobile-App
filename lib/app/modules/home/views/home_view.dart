import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lautan_uang/app/controllers/page_index_controller.dart';
import 'package:lautan_uang/app/data/models/dummy_PenawaranBaru.dart';
import 'package:lautan_uang/app/routes/app_pages.dart';
import 'package:lautan_uang/app/widgets/welcome_card.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';
import '../../../data/models/dummy_ProvinsiNelayan.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

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
      body: Obx(
        () {
          if (controller.isLoading.value) {
            // Tampilkan indikator loading jika data sedang dimuat
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.fishermanTeams.isEmpty) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Section 1 - Kartu Selamat Datang Kembali, Info Saldo dan Poin
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: WelcomeCard(),
                  ),

                  // Section 2 - Tawaran Untuk Anda
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Tawaran Untuk Anda",
                          style: textSmallPrussianBlue500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150,
                          aspectRatio: 21 / 9,
                          viewportFraction: 0.8,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 800,
                          ),
                        ),
                        items: [
                          "assets/images/Tawaran1.png",
                          "assets/images/Tawaran2.png",
                          "assets/images/Tawaran3.png",
                        ].map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      i,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Section 3 - Investasi ke Nelayan Pilihanmu
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Investasi ke Nelayan Pilihanmu",
                              style: textSmallPrussianBlue500,
                            ),
                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.ALL_FISHERMAN_TEAM);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: PrussianBlueColor,
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: textSmallAzureWhiteBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: SizedBox(
                          width: sizeW,
                          height: 230,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AzureishWhiteColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/AllFishermanEmpty.png",
                                    width: sizeW * 0.65,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Belum Ada Nelayan",
                                    style: textSmallPrussianBlueBold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Section 4 - Segera Hadir Penawaran ke Nelayan Baru
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Penawaran Baru Segera Hadir",
                              style: textSmallPrussianBlue500,
                            ),
                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.ALL_NEW_OFFER);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: PrussianBlueColor,
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: textSmallAzureWhiteBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (PenawaranBaruContents.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: SizedBox(
                            width: sizeW,
                            height: 230,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AzureishWhiteColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/EmptyOffer.png",
                                      fit: BoxFit.fill,
                                      width: sizeW * 0.5,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Belum Ada Penawaran",
                                      style: textSmallPrussianBlueBold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: PenawaranBaruContents.length > 5
                                  ? 6
                                  : PenawaranBaruContents.length,
                              itemBuilder: (context, index) {
                                if (index == 5 &&
                                    PenawaranBaruContents.length > 5) {
                                  return InkWell(
                                    onTap: () {
                                      Get.offAllNamed(Routes.ALL_NEW_OFFER);
                                    },
                                    child: SizedBox(
                                      width: 150,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AzureishWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.arrow_forward,
                                              color: PrussianBlueColor,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Lihat Semua",
                                              style: textSmallPrussianBlueBold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: AzureishWhiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Image.asset(
                                            PenawaranBaruContents[index].gambar,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  PenawaranBaruContents[index]
                                                      .timNelayan,
                                                  style:
                                                      textMediumPrussianBlue500,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  width: sizeW,
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      LinearProgressIndicator(
                                                        value:
                                                            PenawaranBaruContents[
                                                                        index]
                                                                    .persentase /
                                                                100,
                                                        backgroundColor: Colors
                                                            .grey
                                                            .withOpacity(0.3),
                                                        valueColor:
                                                            const AlwaysStoppedAnimation<
                                                                Color>(
                                                          PrussianBlueColor,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Nilai Bisnis",
                                                            style:
                                                                textVerySmallPrussianBlueNormal,
                                                          ),
                                                          Text(
                                                            "${PenawaranBaruContents[index].persentase}%",
                                                            style:
                                                                textVerySmallPrussianBlueNormal,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  NumberFormat.currency(
                                                    locale: 'id',
                                                    decimalDigits: 0,
                                                    symbol: 'Rp',
                                                  ).format(
                                                    PenawaranBaruContents[index]
                                                        .nilaiBisnis,
                                                  ),
                                                  style:
                                                      textSmallPrussianBlue500,
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
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                width: 10,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Section 5 - Bantu Nelayan di Nusantara
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Bantu Nelayan di Nusantara",
                              style: textSmallPrussianBlue500,
                            ),
                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.ALL_PROVINCE);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: PrussianBlueColor,
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: textSmallAzureWhiteBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: SizedBox(
                          width: sizeW,
                          height: 230,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AzureishWhiteColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/AllFishermanEmpty.png",
                                    width: sizeW * 0.65,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Belum Ada Nelayan",
                                    style: textSmallPrussianBlueBold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Section 1 - Kartu Selamat Datang Kembali, Info Saldo dan Poin
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: WelcomeCard(),
                  ),

                  // Section 2 - Tawaran Untuk Anda
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Tawaran Untuk Anda",
                          style: textSmallPrussianBlue500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150,
                          aspectRatio: 21 / 9,
                          viewportFraction: 0.8,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 800,
                          ),
                        ),
                        items: [
                          "assets/images/Tawaran1.png",
                          "assets/images/Tawaran2.png",
                          "assets/images/Tawaran3.png",
                        ].map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      i,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Section 3 - Investasi ke Nelayan Pilihanmu
                  Obx(
                    () => controller.fishermanTeams.isEmpty
                        ? const CircularProgressIndicator()
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Investasi ke Nelayan Pilihanmu",
                                      style: textSmallPrussianBlue500,
                                    ),
                                    SizedBox(
                                      height: 25,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.offAllNamed(
                                              Routes.ALL_FISHERMAN_TEAM);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const StadiumBorder(),
                                          backgroundColor: PrussianBlueColor,
                                        ),
                                        child: Text(
                                          "Lihat Semua",
                                          style: textSmallAzureWhiteBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 250,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        controller.fishermanTeams.length > 5
                                            ? 6
                                            : controller.fishermanTeams.length,
                                    itemBuilder: (context, index) {
                                      var fishermanTeam =
                                          controller.fishermanTeams[index];
                                      if (index == 5 &&
                                          controller.fishermanTeams.length >
                                              5) {
                                        return InkWell(
                                          onTap: () {
                                            Get.offAllNamed(
                                                Routes.ALL_FISHERMAN_TEAM);
                                          },
                                          child: SizedBox(
                                            width: 150,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AzureishWhiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.arrow_forward,
                                                    color: PrussianBlueColor,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Lihat Semua",
                                                    style:
                                                        textSmallPrussianBlueBold,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                            Routes.FISHERMAN_DETAIL,
                                            arguments: {
                                              'dataId': fishermanTeam['id'],
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: AzureishWhiteColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                  child: Image.asset(
                                                    "assets/images/ContohTimNelayan1.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          fishermanTeam[
                                                              'fisherman_team_name'],
                                                          style:
                                                              textMediumPrussianBlue500,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: SizedBox(
                                                          width: sizeW,
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              LinearProgressIndicator(
                                                                value: fishermanTeam[
                                                                        'percentage'] /
                                                                    100,
                                                                backgroundColor:
                                                                    Colors.grey
                                                                        .withOpacity(
                                                                            0.3),
                                                                valueColor:
                                                                    const AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  PrussianBlueColor,
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Nilai Bisnis",
                                                                    style:
                                                                        textVerySmallPrussianBlueNormal,
                                                                  ),
                                                                  Text(
                                                                    "${fishermanTeam['percentage'].toStringAsFixed(2)}%", // Convert double to string with 2 decimal places
                                                                    style:
                                                                        textVerySmallPrussianBlueNormal,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          NumberFormat.currency(
                                                            locale: 'id',
                                                            decimalDigits: 0,
                                                            symbol: 'Rp',
                                                          ).format(
                                                            fishermanTeam[
                                                                'business_value'],
                                                          ),
                                                          style:
                                                              textSmallPrussianBlue500,
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
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Section 4 - Segera Hadir Penawaran ke Nelayan Baru
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Penawaran Baru Segera Hadir",
                              style: textSmallPrussianBlue500,
                            ),
                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.ALL_NEW_OFFER);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: PrussianBlueColor,
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: textSmallAzureWhiteBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (PenawaranBaruContents.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: SizedBox(
                            width: sizeW,
                            height: 230,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AzureishWhiteColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/EmptyOffer.png",
                                      fit: BoxFit.fill,
                                      width: sizeW * 0.5,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Belum Ada Penawaran",
                                      style: textSmallPrussianBlueBold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: PenawaranBaruContents.length > 5
                                  ? 6
                                  : PenawaranBaruContents.length,
                              itemBuilder: (context, index) {
                                if (index == 5 &&
                                    PenawaranBaruContents.length > 5) {
                                  return InkWell(
                                    onTap: () {
                                      Get.offAllNamed(Routes.ALL_NEW_OFFER);
                                    },
                                    child: SizedBox(
                                      width: 150,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AzureishWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.arrow_forward,
                                              color: PrussianBlueColor,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Lihat Semua",
                                              style: textSmallPrussianBlueBold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: AzureishWhiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Image.asset(
                                            PenawaranBaruContents[index].gambar,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  PenawaranBaruContents[index]
                                                      .timNelayan,
                                                  style:
                                                      textMediumPrussianBlue500,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  width: sizeW,
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      LinearProgressIndicator(
                                                        value:
                                                            PenawaranBaruContents[
                                                                        index]
                                                                    .persentase /
                                                                100,
                                                        backgroundColor: Colors
                                                            .grey
                                                            .withOpacity(0.3),
                                                        valueColor:
                                                            const AlwaysStoppedAnimation<
                                                                Color>(
                                                          PrussianBlueColor,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Nilai Bisnis",
                                                            style:
                                                                textVerySmallPrussianBlueNormal,
                                                          ),
                                                          Text(
                                                            "${PenawaranBaruContents[index].persentase}%",
                                                            style:
                                                                textVerySmallPrussianBlueNormal,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  NumberFormat.currency(
                                                    locale: 'id',
                                                    decimalDigits: 0,
                                                    symbol: 'Rp',
                                                  ).format(
                                                    PenawaranBaruContents[index]
                                                        .nilaiBisnis,
                                                  ),
                                                  style:
                                                      textSmallPrussianBlue500,
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
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                width: 10,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Section 5 - Bantu Nelayan di Nusantara
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Bantu Nelayan di Nusantara",
                              style: textSmallPrussianBlue500,
                            ),
                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.ALL_PROVINCE);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: PrussianBlueColor,
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: textSmallAzureWhiteBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: provinsiContents.length > 2
                              ? 2
                              : provinsiContents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          provinsiContents[index].logoProvinsi,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        width: sizeW,
                                        decoration: BoxDecoration(
                                          color: AzureishWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                provinsiContents[index]
                                                    .namaProvinsi,
                                                style: textSmallPrussianBlue500,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "${provinsiContents[index].totalNelayan} Nelayan",
                                                    style:
                                                        textVerySmallPrussianBlueNormal,
                                                  ),
                                                  Text(
                                                    "${provinsiContents[index].persentase}%",
                                                    style:
                                                        textVerySmallPrussianBlueNormal,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
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
