class PenawaranBaru {
  final String gambar;
  final String timNelayan;
  final String lokasi;
  final double presentase;
  final int totalInvestasi;

  PenawaranBaru({
    required this.gambar,
    required this.timNelayan,
    required this.lokasi,
    required this.presentase,
    required this.totalInvestasi,
  });
}

const gambarNelayan = "assets/images/Dummy_PenawaranBaru.png";

// ignore: non_constant_identifier_names
List<PenawaranBaru> PenawaranBaruContents = [
  PenawaranBaru(
    gambar: gambarNelayan,
    timNelayan: "Nelayan Wani",
    lokasi: "Surabaya, Jawa Timur",
    presentase: 0,
    totalInvestasi: 500000000,
  ),
  PenawaranBaru(
    gambar: gambarNelayan,
    timNelayan: "Nelayan Lautan Api",
    lokasi: "Cilacap, Jawa Tengah",
    presentase: 0,
    totalInvestasi: 250000000,
  ),
  PenawaranBaru(
    gambar: gambarNelayan,
    timNelayan: "Nelayan Iwak",
    lokasi: "Balikpapan, Kalimantan Timur",
    presentase: 0,
    totalInvestasi: 1000000000,
  ),
  PenawaranBaru(
    gambar: gambarNelayan,
    timNelayan: "Nelayan Lautan Cuan",
    lokasi: "Samarinda, Kalimantan Timur",
    presentase: 0,
    totalInvestasi: 275000000,
  ),
  PenawaranBaru(
    gambar: gambarNelayan,
    timNelayan: "Nelayan Mengadu Nasib",
    lokasi: "Jakarta Utara, DKI Jakarta",
    presentase: 0,
    totalInvestasi: 660000000,
  ),
  PenawaranBaru(
    gambar: gambarNelayan,
    timNelayan: "Nelayan Dompak",
    lokasi: "Tanjung Pinang, Kepulauan Riau",
    presentase: 0,
    totalInvestasi: 825000000,
  ),
];
