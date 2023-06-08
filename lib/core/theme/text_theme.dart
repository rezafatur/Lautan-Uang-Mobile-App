import 'package:flutter/material.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';
import 'colors.dart';

// Text with Prussian Blue Color (Large, Medium, and Small)
final textSmallPrussianBlue = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: PrussianBlueColor,
);

final textVerySmallPrussianBlueNormal = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 2.5,
  fontWeight: FontWeight.normal,
  color: PrussianBlueColor,
);

final textSmallPrussianBlue500 = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.w500,
);

final textMediumPrussianBlue500 = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 4,
  fontWeight: FontWeight.w500,
);

final textSmallPrussianBlueBold = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
);

final textLargePrussianBlueBold = TextStyle(
  color: PrussianBlueColor,
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
);

// Text with Azure White Color (Large, Medium, and Small)
final textSmallAzureWhiteBold = TextStyle(
  color: AzureishWhiteColor,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
);

final textLargeAzureWhite500 = TextStyle(
  color: AzureishWhiteColor,
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.w500,
);

// Text with Black Color (Large, Medium, and Small)
final textSmallBlackBold = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
);

final textMediumBlackBold = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 4,
  fontWeight: FontWeight.bold,
);

final textLargeBlackBold = TextStyle(
  color: Colors.black,
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
);

// Style Text dibawah akan diganti di update selanjutnya

// Onboarding Screen
final onboardTitle = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: AzureishWhiteColor,
);

final onboardDescription = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: AzureishWhiteColor,
);

final onboardNavText = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: AzureishWhiteColor,
);

// Login Screen
final loginButton = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  color: AzureishWhiteColor,
);

final loginError = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: ErrorMessageColor,
);

final loginBelumPunyaAkun = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
);

final loginDaftar = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

// Register Screen
final daftarHeader = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 10,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final daftarButton = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  color: AzureishWhiteColor,
);

final daftarSudahPunyaAkun = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
);

final daftarLogin = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

// Profile
final textAppBarProfile = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textHintProfile = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textSimpanProfile = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

// Fisherman Detail
final textAppBarFishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textLokasiFishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4,
  color: Colors.black,
);

final textTeamFishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textFundFishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final textTargetFishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.grey,
);

final textTotalInvestorFishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.grey,
);

final textStatistik1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

final textStatistik2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: PrussianBlueColor,
);

final textHistori1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

final textHistori2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: PrussianBlueColor,
);

final textKapitalisasiPasar1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textKapitalisasiPasar2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final textTotalAset1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textTotalAset2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final textHasilDividen1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textHasilDividen2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final textRasioUtang1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textRasioUtang2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final textTotalTangkapan1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textTotalTangkapan2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final textPendapatan1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textPendapatan2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final textPengeluaran1FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textPengeluaran2FishermanDetail = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4.5,
  fontWeight: FontWeight.bold,
  color: PrussianBlueColor,
);

final textInvestasiSekarang = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

// Portfolio Screen
final textPortofolio = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final textTotalPortofolio = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

final textTotalPortofolioRP = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 7,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final textPengembalian = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

final textPortfolioKosong = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textPortfolioFishermanTeam = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textPortfolioFishermanLocation = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textPortfolioTotal = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textPortfolioPengembalian = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

// Transaction Screen
final textTransaksi = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final textTransaksiProses = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

final textTotalTransaksiProses = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final textTransaksiBerhasil = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

final textTotalTransaksiBerhasil = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final textTransaksiGagal = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

final textTotalTransaksiGagal = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final textTransaksiKosong = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textTransaksiNelayan = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textTransaksiportfolio = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textTransaksiStatus = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

// Balance Screen
final textProfileSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final textViewProfile = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.white,
);

final textSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textTotalSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textTarikSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  color: Colors.black,
);

final textDepositSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  color: Colors.black,
);

final textRiwayatSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 4,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textRiwayatKosong = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textTanggalSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textStatusSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  color: Colors.black,
);

final textJenisSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textTotalRiwayatSaldo = TextStyle(
  fontSize: SizeConfig.blockHorizontal! * 3.5,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
