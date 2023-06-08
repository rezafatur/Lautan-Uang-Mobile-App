import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    // Membuat warna gradient menjadi lebih halus
    Paint.enableDithering = true;

    // Format Waktu Pengguna
    DateTime timeNow = DateTime.now();
    DateFormat('HH:mm:ss').format(timeNow);

    // Ucapan selamat berdasarkan waktu
    String greeting = '';
    if (timeNow.hour >= 5 && timeNow.hour < 11) {
      greeting = 'Selamat Pagi';
    } else if (timeNow.hour < 15) {
      greeting = 'Selamat Siang';
    } else if (timeNow.hour < 18) {
      greeting = 'Selamat Sore';
    } else {
      greeting = 'Selamat Malam';
    }

    return Container(
      width: sizeW,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          colors: [
            PrussianBlueColor,
            DarkCeruleanColor,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ucapan Selamat Pagi/Siang/Sore/Malam
          Text(
            "$greeting, Investor!",
            style: textLargeAzureWhite500,
          ),
          const SizedBox(
            height: 20,
          ),

          // Box Saldo dan Poin
          Container(
            width: sizeW,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: AzureishWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/wallet_card.png",
                        height: sizeW * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Saldo",
                              style: textSmallPrussianBlue,
                            ),
                            Text(
                              "Rp10.000.000",
                              style: textSmallPrussianBlueBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/point_card.png",
                        height: sizeW * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Poin",
                              style: textSmallPrussianBlue,
                            ),
                            Text(
                              "10.000",
                              style: textSmallPrussianBlueBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
