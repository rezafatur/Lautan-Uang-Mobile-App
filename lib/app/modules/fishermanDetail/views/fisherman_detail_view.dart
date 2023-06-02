import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../controllers/fisherman_detail_controller.dart';
import 'package:lautan_uang/app/widgets/FishermanDetailStatistikSection.dart';
import 'package:lautan_uang/app/widgets/FishermanDetailHistoriSection.dart';

class FishermanDetailView extends GetView<FishermanDetailController> {
  const FishermanDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FishermanDetailController());
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Detail Nelayan",
          style: textAppBarFishermanDetail,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Section 1 - Gambar Nelayan
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                aspectRatio: 21 / 9,
                viewportFraction: 1,
                enableInfiniteScroll: true,
              ),
              items: [
                "assets/images/ContohTawaran1.png",
                "assets/images/ContohTawaran2.png",
                "assets/images/ContohTawaran3.png",
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
                      "Samarinda, Kalimantan Timur",
                      style: textLokasiFishermanDetail,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nelayan Lautan Api Merah Putih",
                      style: textTeamFishermanDetail,
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
                            "Rp 552.200.00",
                            style: textFundFishermanDetail,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "dari target Rp 1.000.000.000",
                            style: textTargetFishermanDetail,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: 50 / 100,
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
                      "190 Investor",
                      style: textTotalInvestorFishermanDetail,
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
                          color:
                              controller.selectedCategory.value == "Statistik"
                                  ? PrussianBlueColor
                                  : PrussianBlueColor,
                        ),
                        backgroundColor:
                            controller.selectedCategory.value == "Statistik"
                                ? PrussianBlueColor
                                : Colors.white,
                      ),
                      child: Text(
                        "Statistik",
                        style: controller.selectedCategory.value == "Statistik"
                            ? textStatistik1FishermanDetail
                            : textStatistik2FishermanDetail,
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
                          color: controller.selectedCategory.value == "Histori"
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
                        style: controller.selectedCategory.value == "Histori"
                            ? textHistori1FishermanDetail
                            : textHistori2FishermanDetail,
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
                  return const FishermanDetailStatistikSection();
                } else if (controller.selectedCategory.value == "Histori") {
                  return const FishermanDetailHistoriSection();
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,

      // Section 6 - Tombol atau Button "Investasi Sekarang"
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SizedBox(
          width: sizeW,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: MaximumBlueColor,
            ),
            child: Text(
              'Investasi Sekarang',
              style: textInvestasiSekarang,
            ),
          ),
        ),
      ),
    );
  }
}
