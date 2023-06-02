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
                        style: textTotalTangkapan1FishermanDetail,
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
                            style: textTotalTangkapan2FishermanDetail,
                          ),
                          Text(
                            "/bulan",
                            style: textTotalTangkapan1FishermanDetail,
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
                        style: textPendapatan1FishermanDetail,
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
                            style: textPendapatan2FishermanDetail,
                          ),
                          Text(
                            "/bulan",
                            style: textPendapatan1FishermanDetail,
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
                        style: textPengeluaran1FishermanDetail,
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
                            style: textPengeluaran2FishermanDetail,
                          ),
                          Text(
                            "/bulan",
                            style: textPengeluaran1FishermanDetail,
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
