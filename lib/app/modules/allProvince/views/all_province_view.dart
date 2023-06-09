import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../data/models/dummy_ProvinsiNelayan.dart';
import '../../../routes/app_pages.dart';
import '../controllers/all_province_controller.dart';

class AllProvinceView extends GetView<AllProvinceController> {
  const AllProvinceView({Key? key}) : super(key: key);
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
        ),
        title: Text(
          "List Provinsi",
          style: textLargeBlackBold,
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            // Tampilkan indikator loading jika data sedang dimuat
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.fishermanTeams.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/AllFishermanEmpty.png",
                    width: sizeW,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Belum Ada Tim Nelayan",
                    style: textLargePrussianBlueBold,
                  ),
                ],
              ),
            );
          } else {
            return Obx(
              () => controller.fishermanTeams.isEmpty
                  ? const CircularProgressIndicator()
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provinsiContents.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                // Logo Provinsi, Nama Provinsi, Total Nelayan, dan Persentase
                                Row(
                                  children: [
                                    // Logo Provinsi
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: sizeH * 0.1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.asset(
                                            provinsiContents[index]
                                                .logoProvinsi,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),

                                    // Nama Provinsi, Total Nelayan, dan Persentase
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provinsiContents[index]
                                                .namaProvinsi,
                                            style: textMediumBlackBold,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${provinsiContents[index].persentase.toStringAsFixed(2)}%",
                                                style: textSmallBlackBold,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              LinearProgressIndicator(
                                                value: provinsiContents[index]
                                                        .persentase /
                                                    100,
                                                backgroundColor: Colors.grey
                                                    .withOpacity(0.3),
                                                valueColor:
                                                    const AlwaysStoppedAnimation<
                                                        Color>(
                                                  PrussianBlueColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              // Total Nelayan
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    "Total Nelayan",
                                                  ),
                                                  Text(
                                                    provinsiContents[index]
                                                        .totalNelayan
                                                        .toString(),
                                                    style: textSmallBlackBold,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                // Garis atau Batas Pemisah Tim Nelayan
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
                              ],
                            );
                          },
                        ),
                      ),
                    ),
            );
          }
        },
      ),
      // Warna Background atau Latar Belakang
      backgroundColor: Colors.white,
    );
  }
}
