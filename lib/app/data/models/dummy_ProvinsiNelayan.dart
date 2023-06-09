class ProvinsiNelayan {
  final String logoProvinsi;
  final String namaProvinsi;
  final int totalNelayan;
  final double persentase;

  ProvinsiNelayan({
    required this.logoProvinsi,
    required this.namaProvinsi,
    required this.totalNelayan,
    required this.persentase,
  });
}

List<ProvinsiNelayan> provinsiContents = [
  ProvinsiNelayan(
    logoProvinsi: "assets/images/Dummy_LogoProvinsiKalimantanTimur.png",
    namaProvinsi: "Kalimantan Timur",
    totalNelayan: 10,
    persentase: 90.90,
  ),
  ProvinsiNelayan(
    logoProvinsi: "assets/images/Dummy_LogoProvinsiJawaTimur.png",
    namaProvinsi: "Jawa Timur",
    totalNelayan: 1,
    persentase: 9.09,
  ),
];
