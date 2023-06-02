import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lautan_uang/app/controllers/page_index_controller.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';

import '../controllers/balance_controller.dart';

class BalanceView extends GetView<BalanceController> {
  BalanceView({Key? key}) : super(key: key);

  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Lautan Uang",
            style: textAppBar,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 50,
              height: 50,
              child: Icon(
                Icons.account_circle_rounded,
                color: PrussianBlueColor,
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'BalanceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
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
