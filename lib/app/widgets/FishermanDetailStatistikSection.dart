import 'package:flutter/material.dart';
import '../../core/theme/text_theme.dart';

class FishermanDetailStatistikSection extends StatelessWidget {
  const FishermanDetailStatistikSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section 1 - Kapitalisasi Pasar dan Total Aset
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
                        "Rp 1.050.000.000",
                        style: textMediumLargePrussianBlueBold,
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
                        "Rp 55.000.000",
                        style: textMediumLargePrussianBlueBold,
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

        // Section 2 - Hasil Dividen dan Rasio Utang Modal
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
                        "5%",
                        style: textMediumLargePrussianBlueBold,
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
                        "49%",
                        style: textMediumLargePrussianBlueBold,
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
  }
}
