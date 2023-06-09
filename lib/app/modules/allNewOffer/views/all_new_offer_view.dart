import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../data/models/dummy_PenawaranBaru.dart';
import '../../../routes/app_pages.dart';
import '../controllers/all_new_offer_controller.dart';

class AllNewOfferView extends GetView<AllNewOfferController> {
  const AllNewOfferView({Key? key}) : super(key: key);

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
          "List Penawaran Baru",
          style: textLargeBlackBold,
        ),
      ),
      body: PenawaranBaruContents.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/EmptyOffer.png",
                    width: sizeW,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Belum Ada Penawaran Baru",
                    style: textLargePrussianBlueBold,
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: PenawaranBaruContents.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        // Gambar, Nama Tim, Persentase, Nilai Bisnis, dan Total Investor
                        Row(
                          children: [
                            // Gambar Tim Nelayan
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: sizeH * 0.1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    PenawaranBaruContents[index].gambar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),

                            // Nama Tim, Persentase, Nilai Bisnis, dan Total Investor
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    PenawaranBaruContents[index].timNelayan,
                                    style: textMediumBlackBold,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${PenawaranBaruContents[index].persentase.toStringAsFixed(2)}%",
                                        style: textSmallBlackBold,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      LinearProgressIndicator(
                                        value: PenawaranBaruContents[index]
                                                .persentase /
                                            100,
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.3),
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                          PrussianBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      // Nilai Bisnis
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Nilai Bisnis",
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                locale: 'id',
                                                decimalDigits: 0,
                                                symbol: 'Rp',
                                              ).format(
                                                PenawaranBaruContents[index]
                                                    .nilaiBisnis,
                                              ),
                                              style: textSmallBlackBold,
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Total Investor
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                              "Total Investor",
                                            ),
                                            Text(
                                              PenawaranBaruContents[index]
                                                  .totalInvestor
                                                  .toString(),
                                              style: textSmallBlackBold,
                                            ),
                                          ],
                                        ),
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
      // Warna Background atau Latar Belakang
      backgroundColor: Colors.white,
    );
  }
}
