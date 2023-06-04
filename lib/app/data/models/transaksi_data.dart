class Transaksi {
  final String fishermanTeam;
  final int totalPortfolio;
  final String status;

  Transaksi({
    required this.fishermanTeam,
    required this.totalPortfolio,
    required this.status,
  });
}

List<Transaksi> TransaksiContents = [
  Transaksi(
    fishermanTeam: "Nelayan Lautan Api Merah Putih",
    totalPortfolio: 10000000,
    status: "Sedang Proses",
  ),
  Transaksi(
    fishermanTeam: "Nelayan Semangat Pejuang",
    totalPortfolio: 10000000,
    status: "Sedang Proses",
  ),
  Transaksi(
    fishermanTeam: "Nelayan Merah Darahku",
    totalPortfolio: 5000000,
    status: "Berhasil",
  ),
  Transaksi(
    fishermanTeam: "Ikan Hiu",
    totalPortfolio: 10000000,
    status: "Berhasil",
  ),
  Transaksi(
    fishermanTeam: "Nelayan Belahan Samudra",
    totalPortfolio: 20000000,
    status: "Berhasil",
  ),
  Transaksi(
    fishermanTeam: "Nelayan Putih Tulangku",
    totalPortfolio: 10000000,
    status: "Berhasil",
  ),
  Transaksi(
    fishermanTeam: "Nelayan Di Dadaku",
    totalPortfolio: 10000000,
    status: "Berhasil",
  ),
];
