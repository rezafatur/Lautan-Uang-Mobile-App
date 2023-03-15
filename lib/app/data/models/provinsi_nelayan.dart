class ProvinsiNelayan {
  final String logo_provinsi;
  final String nama_provinsi;
  final int totalNelayan;
  final double presentase;

  ProvinsiNelayan({
    required this.logo_provinsi,
    required this.nama_provinsi,
    required this.totalNelayan,
    required this.presentase,
  });
}

List<ProvinsiNelayan> ProvinsiContents = [
  ProvinsiNelayan(
    logo_provinsi: "assets/images/Logo Provinsi Bali.png",
    nama_provinsi: "Bali",
    totalNelayan: 10,
    presentase: 5.6,
  ),
  ProvinsiNelayan(
    logo_provinsi: "assets/images/Logo Provinsi DKI Jakarta.png",
    nama_provinsi: "DKI Jakarta",
    totalNelayan: 10,
    presentase: 5.6,
  ),
  ProvinsiNelayan(
    logo_provinsi: "assets/images/Logo Provinsi Jawa Timur.png",
    nama_provinsi: "Jawa Timur",
    totalNelayan: 10,
    presentase: 5.6,
  ),
  ProvinsiNelayan(
    logo_provinsi: "assets/images/Logo Provinsi Kalimantan Timur.png",
    nama_provinsi: "Kalimantan Timur",
    totalNelayan: 10,
    presentase: 5.6,
  ),
  ProvinsiNelayan(
    logo_provinsi: "assets/images/Logo Provinsi Sumatera Selatan.png",
    nama_provinsi: "Sumatera Selatan",
    totalNelayan: 10,
    presentase: 5.6,
  ),
];
