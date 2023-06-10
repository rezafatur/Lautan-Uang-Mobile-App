import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lautan_uang/app/routes/app_pages.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../controllers/fisherman_detail_controller.dart';

class FishermanDetailView extends GetView<FishermanDetailController> {
  const FishermanDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FishermanDetailController());
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
        title: Text(
          "Detail Nelayan",
          style: textLargeBlackBold,
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: PrussianBlueColor,
              ),
            );
          } else {
            var fishermanTeam = controller.fishermanTeams.first;
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Section 1 - Gambar Nelayan
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 250,
                      aspectRatio: 21 / 9,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                    ),
                    items: [
                      "assets/images/DetailNelayan1.png",
                      "assets/images/DetailNelayan2.png",
                      "assets/images/DetailNelayan3.png",
                    ].map(
                      (i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                              child: Image.asset(
                                i,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Section 2 - Lokasi dan Nama Tim Nelayan
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            fishermanTeam['location'],
                            style: textMediumBlack,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            fishermanTeam['fisherman_team_name'],
                            style: textLargeBlackBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Section 3 - Total Dana Terkumpul, Target Dana, dan Jumlah Investor
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: 'Rp',
                                  ).format(
                                    fishermanTeam['collected_funds'],
                                  ),
                                  style: textLargePrussianBlueBold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: 'target Rp',
                                  ).format(
                                    fishermanTeam['expected_funds'],
                                  ),
                                  style: textSmallGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        LinearProgressIndicator(
                          value: fishermanTeam['percentage'] / 100,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            PrussianBlueColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${fishermanTeam['investor_count']} Investor",
                            style: textSmallGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Section 4 - Kumpulan Kategori Detail Nelayan (Statistik & Histori)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => ElevatedButton(
                            onPressed: () {
                              controller.changeCategory("Statistik");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              side: BorderSide(
                                width: 2,
                                color: controller.selectedCategory.value ==
                                        "Statistik"
                                    ? PrussianBlueColor
                                    : PrussianBlueColor,
                              ),
                              backgroundColor:
                                  controller.selectedCategory.value ==
                                          "Statistik"
                                      ? PrussianBlueColor
                                      : Colors.white,
                            ),
                            child: Text(
                              "Statistik",
                              style: controller.selectedCategory.value ==
                                      "Statistik"
                                  ? textSmallWhite
                                  : textSmallPrussianBlue,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => ElevatedButton(
                            onPressed: () {
                              controller.changeCategory("Histori");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              side: BorderSide(
                                width: 2,
                                color: controller.selectedCategory.value ==
                                        "Histori"
                                    ? PrussianBlueColor
                                    : PrussianBlueColor,
                              ),
                              backgroundColor:
                                  controller.selectedCategory.value == "Histori"
                                      ? PrussianBlueColor
                                      : Colors.white,
                            ),
                            child: Text(
                              "Histori",
                              style:
                                  controller.selectedCategory.value == "Histori"
                                      ? textSmallWhite
                                      : textSmallPrussianBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Section 5 - Menampilkan Data sesuai Kategori yang Dipilih
                  Obx(
                    () {
                      if (controller.selectedCategory.value == "Statistik") {
                        return Column(
                          children: [
                            // Kapitalisasi Pasar dan Total Aset
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Kapitalisasi Pasar",
                                            style: textSmallBlack,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            NumberFormat.currency(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: 'Rp',
                                            ).format(
                                              fishermanTeam['statistic']
                                                  ['market_cap'],
                                            ),
                                            style:
                                                textMediumLargePrussianBlueBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Total Aset",
                                            style: textSmallBlack,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            NumberFormat.currency(
                                              locale: 'id',
                                              decimalDigits: 0,
                                              symbol: 'Rp',
                                            ).format(
                                              fishermanTeam['statistic']
                                                  ['assets_total'],
                                            ),
                                            style:
                                                textMediumLargePrussianBlueBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // Hasil Dividen dan Rasio Utang Modal
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Hasil Dividen",
                                            style: textSmallBlack,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${fishermanTeam['statistic']['divident_yield'].toString()}%",
                                            style:
                                                textMediumLargePrussianBlueBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Rasio Utang Modal",
                                            style: textSmallBlack,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${fishermanTeam['statistic']['debt_to_equity'].toString()}%",
                                            style:
                                                textMediumLargePrussianBlueBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (controller.selectedCategory.value ==
                          "Histori") {
                        return Column(
                          children: [
                            // Total Tangkapan
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Total Tangkapan",
                                      style: textSmallBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          "${fishermanTeam['fisherman_catch']['total_weight'].toString()} ton",
                                          style:
                                              textMediumLargePrussianBlueBold,
                                        ),
                                        Text(
                                          "/bulan",
                                          style: textSmallBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // Pendapatan
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Pendapatan",
                                      style: textSmallBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          NumberFormat.currency(
                                            locale: 'id',
                                            decimalDigits: 0,
                                            symbol: 'Rp',
                                          ).format(
                                            fishermanTeam['fisherman_catch']
                                                ['income'],
                                          ),
                                          style: textLargePrussianBlueBold,
                                        ),
                                        Text(
                                          "/bulan",
                                          style: textSmallBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // Pengeluaran
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Pengeluaran",
                                      style: textSmallBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          NumberFormat.currency(
                                            locale: 'id',
                                            decimalDigits: 0,
                                            symbol: 'Rp',
                                          ).format(
                                            fishermanTeam['fisherman_catch']
                                                ['expenditure'],
                                          ),
                                          style: textLargePrussianBlueBold,
                                        ),
                                        Text(
                                          "/bulan",
                                          style: textSmallBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
      // Warna Background atau Latar Belakang
      backgroundColor: Colors.white,

      // Section 6 - Button atau Tombol "Investasi Sekarang"
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: SizedBox(
          width: sizeW,
          child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed(Routes.INVEST_NOW);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MaximumBlueColor,
            ),
            child: Text(
              'Investasi Sekarang',
              style: textSmallWhite,
            ),
          ),
        ),
      ),
    );
  }
}
