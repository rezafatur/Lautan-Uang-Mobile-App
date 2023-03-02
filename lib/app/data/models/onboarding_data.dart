class Onboarding {
  final String title;
  final String description;
  final String image;

  Onboarding({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<Onboarding> OnboardingContents = [
  Onboarding(
    title: "Investasi dengan modal kecil".toUpperCase(),
    description:
        "Mulailah menginvestasikan asetmu sekarang, bahkan dengan jumlah kecil sekalipun, agar masa depanmu lebih cerah dan menjanjikan!",
    image: "assets/images/onboardPic1.png",
  ),
  Onboarding(
    title: "Gunakan uang tunai atau digital".toUpperCase(),
    description:
        "Kembangkan asetmu dengan berinvestasi, pilih uang tunai atau digital serta opsi lain yang cocok untukmu!",
    image: "assets/images/onboardPic2.png",
  ),
  Onboarding(
    title: "Wujudkan mimpimu menjadi nyata".toUpperCase(),
    description:
        "Dari investasimu, kamu bisa menggapai mimpi dan mewujudkannya menjadi nyata!",
    image: "assets/images/onboardPic3.png",
  ),
];
