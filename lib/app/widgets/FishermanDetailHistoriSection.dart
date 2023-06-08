import 'package:flutter/material.dart';
import '../../core/theme/text_theme.dart';

class FishermanDetailHistoriSection extends StatelessWidget {
  const FishermanDetailHistoriSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section 1 - Total Tangkapan dan Pendapatan
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
                            "10 ton",
                            style: textMediumLargePrussianBlueBold,
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
              Expanded(
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
                            "100 juta",
                            style: textMediumLargePrussianBlueBold,
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
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        // Section 2 - Pengeluaran
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
                            "10 juta",
                            style: textMediumLargePrussianBlueBold,
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
              const Expanded(
                child: Text(""),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
