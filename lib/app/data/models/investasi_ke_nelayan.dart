class InvestasikeNelayan {
  final String gambar;
  final String timNelayan;
  final String provinsi;
  final double presentase;
  final int totalInvestasi;

  InvestasikeNelayan({
    required this.gambar,
    required this.timNelayan,
    required this.provinsi,
    required this.presentase,
    required this.totalInvestasi,
  });
}

List<InvestasikeNelayan> InvestasiContents = [
  InvestasikeNelayan(
    gambar: "assets/images/ContohTimNelayan1.png",
    timNelayan: "Nelayan Lautan Api",
    provinsi: "Jawa Timur",
    presentase: 75.0,
    totalInvestasi: 500000000,
  ),
  InvestasikeNelayan(
    gambar: "assets/images/ContohTimNelayan1.png",
    timNelayan: "Lautan Biru Berlayar",
    provinsi: "Bali",
    presentase: 60.0,
    totalInvestasi: 250000000,
  ),
  InvestasikeNelayan(
    gambar: "assets/images/ContohTimNelayan1.png",
    timNelayan: "Penyerbu Ikan",
    provinsi: "Kalimantan Timur",
    presentase: 25.0,
    totalInvestasi: 1000000000,
  ),
  InvestasikeNelayan(
    gambar: "assets/images/ContohTimNelayan1.png",
    timNelayan: "Lautan Cuan",
    provinsi: "Kalimantan Timur",
    presentase: 95.0,
    totalInvestasi: 275000000,
  ),
  InvestasikeNelayan(
    gambar: "assets/images/ContohTimNelayan1.png",
    timNelayan: "Mengadu Nasib",
    provinsi: "DKI Jakarta",
    presentase: 10.0,
    totalInvestasi: 660000000,
  ),
  InvestasikeNelayan(
    gambar: "assets/images/ContohTimNelayan1.png",
    timNelayan: "Nelayan Pasrah",
    provinsi: "Sumatera Selatan",
    presentase: 35.0,
    totalInvestasi: 825000000,
  ),
];
