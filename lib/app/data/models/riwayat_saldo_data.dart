class RiwayatSaldo {
  final String tanggalSaldo;
  final String jenisSaldo;
  final String statusSaldo;
  final int totalSaldo;

  RiwayatSaldo({
    required this.tanggalSaldo,
    required this.jenisSaldo,
    required this.statusSaldo,
    required this.totalSaldo,
  });
}

List<RiwayatSaldo> RiwayatSaldoContents = [
  RiwayatSaldo(
    tanggalSaldo: "Selasa, 09 Aug 2022",
    jenisSaldo: "Deposit",
    statusSaldo: "Berhasil",
    totalSaldo: 50000000,
  ),
  RiwayatSaldo(
    tanggalSaldo: "Selasa, 09 Agu 2022",
    jenisSaldo: "Deposit",
    statusSaldo: "Berhasil",
    totalSaldo: 50000000,
  ),
  RiwayatSaldo(
    tanggalSaldo: "Senin, 01 Agu 2022",
    jenisSaldo: "Tarik",
    statusSaldo: "Berhasil",
    totalSaldo: 50000000,
  ),
  RiwayatSaldo(
    tanggalSaldo: "Minggu, 24 Jul 2022",
    jenisSaldo: "Tarik",
    statusSaldo: "Gagal",
    totalSaldo: 5000000,
  ),
  RiwayatSaldo(
    tanggalSaldo: "Jum'at, 10 Jun 2022",
    jenisSaldo: "Tarik",
    statusSaldo: "Gagal",
    totalSaldo: 2500000,
  ),
  RiwayatSaldo(
    tanggalSaldo: "Kamis, 26 Mei 2022",
    jenisSaldo: "Tarik",
    statusSaldo: "Berhasil",
    totalSaldo: 1000000,
  ),
  RiwayatSaldo(
    tanggalSaldo: "Sabtu, 30 Apr 2022",
    jenisSaldo: "Deposit",
    statusSaldo: "Berhasil",
    totalSaldo: 10000000,
  ),
];
