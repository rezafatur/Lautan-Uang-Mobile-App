import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lautan_uang/app/controllers/page_index_controller.dart';
import 'package:lautan_uang/app/data/models/investasi_ke_nelayan.dart';
import 'package:lautan_uang/app/data/models/provinsi_nelayan.dart';
import 'package:lautan_uang/app/modules/fishermanDetail/views/fisherman_detail_view.dart';
import 'package:lautan_uang/app/modules/profile/views/profile_view.dart';
import 'package:lautan_uang/app/widgets/welcome_card.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            "Lautan Uang",
            style: textAppBar,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileView()),
                );
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
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Kartu Selamat Datang Kembali, Info Saldo dan Poin
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  style: textTawaran,
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
                  "assets/images/ContohTawaran1.png",
                  "assets/images/ContohTawaran2.png",
                  "assets/images/ContohTawaran3.png",
                ].map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Investasi ke Nelayan Pilihanmu",
                      style: textBantuNelayan,
                    ),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: PrussianBlueColor,
                        ),
                        child: Text(
                          "Lihat Semua",
                          style: textLihatSemua,
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
                    itemCount: InvestasiContents.length > 5
                        ? 6
                        : InvestasiContents.length,
                    itemBuilder: (context, index) {
                      if (index == 5 && InvestasiContents.length > 5) {
                        return InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AzureishWhiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    style: textLihatSemua2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FishermanDetailView()),
                          );
                        },
                        child: Container(
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
                                    InvestasiContents[index].gambar,
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
                                          InvestasiContents[index].timNelayan,
                                          style: textTimNelayan,
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
                                                value: InvestasiContents[index]
                                                        .presentase /
                                                    100,
                                                backgroundColor: Colors.grey
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
                                                    style: textNilaiBisnis,
                                                  ),
                                                  Text(
                                                    "${InvestasiContents[index].presentase}%",
                                                    style: textNilaiBisnis,
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
                                            InvestasiContents[index]
                                                .totalInvestasi,
                                          ),
                                          style: textTotalInvestasi,
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
                    separatorBuilder: (BuildContext context, int index) =>
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

          // Section 4 - Segera Hadir Penawaran ke Nelayan Baru
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Penawaran Baru Segera Hadir",
                      style: textBantuNelayan,
                    ),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: PrussianBlueColor,
                        ),
                        child: Text(
                          "Lihat Semua",
                          style: textLihatSemua,
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
                    itemCount: InvestasiContents.length > 5
                        ? 6
                        : InvestasiContents.length,
                    itemBuilder: (context, index) {
                      if (index == 5 && InvestasiContents.length > 5) {
                        return InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AzureishWhiteColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    style: textLihatSemua2,
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
                                  InvestasiContents[index].gambar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        InvestasiContents[index].timNelayan,
                                        style: textTimNelayan,
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
                                              value: InvestasiContents[index]
                                                      .presentase /
                                                  100,
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.3),
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
                                                  style: textNilaiBisnis,
                                                ),
                                                Text(
                                                  "${InvestasiContents[index].presentase}%",
                                                  style: textNilaiBisnis,
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
                                          InvestasiContents[index]
                                              .totalInvestasi,
                                        ),
                                        style: textTotalInvestasi,
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
                    separatorBuilder: (BuildContext context, int index) =>
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Bantu Nelayan di Nusantara",
                      style: textBantuNelayan,
                    ),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: PrussianBlueColor,
                        ),
                        child: Text(
                          "Lihat Semua",
                          style: textLihatSemua,
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= ProvinsiContents.length) return null;
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
                                  ProvinsiContents[index].logo_provinsi,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: AzureishWhiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ProvinsiContents[index].nama_provinsi,
                                        style: textNamaProvinsi,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "${ProvinsiContents[index].totalNelayan} Nelayan",
                                            style: textTotalNelayan,
                                          ),
                                          Text(
                                            "${ProvinsiContents[index].presentase}%",
                                            style: textTotalNelayan,
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
            ],
          ),
        ],
      ),

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
            icon: Image.asset("assets/icons/wallet.png"),
            title: "Saldo",
          ),
          TabItem(
            icon: Image.asset("assets/icons/transaction.png"),
            title: "Transaksi",
          ),
        ],
        initialActiveIndex: pageC.pageIndex.value,
        onTap: (int i) => pageC.changePage(i),
      ),
    );
  }
}
