import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../data/models/fisherman_team.dart';
import '../controllers/all_fisherman_team_controller.dart';

class AllFishermanTeamView extends GetView<AllFishermanTeamController> {
  const AllFishermanTeamView({Key? key}) : super(key: key);

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
        title: Text(
          "List Nelayan Pilihan",
          style: textAppBarAllFisherman,
        ),
      ),
      body: FishermanTeamContents.isEmpty
          ? Padding(
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
                    style: textAllFishermanKosong,
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
                  itemCount: FishermanTeamContents.length,
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
                                    FishermanTeamContents[index].picture,
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
                                    FishermanTeamContents[index].fishermanTeam,
                                    style: textAllFishermanTeam,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${FishermanTeamContents[index].percentageExample}%",
                                        style: textAllFishermanPercentage,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      LinearProgressIndicator(
                                        value: FishermanTeamContents[index]
                                                .percentageExample /
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
                                                FishermanTeamContents[index]
                                                    .businessValue,
                                              ),
                                              style: textAllFishermanValue,
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
                                              "${FishermanTeamContents[index].totalInvestor}",
                                              style: textAllFishermanInvestor,
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
