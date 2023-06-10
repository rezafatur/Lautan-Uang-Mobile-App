import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
    SizeConfig().init(context);
    // ignore: unused_local_variable
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      // Navigasi Bagian Atas
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Edit Profil",
          style: textLargeBlackBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Icon
            const Center(
              child: Icon(
                Icons.account_circle_rounded,
                color: PrussianBlueColor,
                size: 150,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Nama
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Nama",
                    style: textSmallBlack,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Nama",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Email",
                    style: textSmallBlack,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Email",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Jenis Kelamin
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Jenis Kelamin",
                    style: textSmallBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: controller.selectedGender != null
                          ? "Pilih Jenis Kelamin"
                          : "Pilih Jenis Kelamin",
                    ),
                    value: controller.selectedGender,
                    items: const [
                      DropdownMenuItem(
                        value: "Laki-Laki",
                        child: Text(
                          "Laki-Laki",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Perempuan",
                        child: Text(
                          "Perempuan",
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      controller.selectedGender = value!;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Alamat Lengkap
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Alamat Lengkap",
                    style: textSmallBlack,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Alamat Lengkap",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Nomor Telepon
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Nomor Telepon",
                    style: textSmallBlack,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Nomor Telepon",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Kata Sandi Baru
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Kata Sandi Baru",
                    style: textSmallBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Material(
                    child: Obx(
                      () => TextField(
                        obscureText: controller.showNewPassword.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.showNewPassword.value =
                                  !(controller.showNewPassword.value);
                            },
                            child: Icon(
                              controller.showNewPassword.value != false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Masukkan Kata Sandi",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Konfirmasi Kata Sandi Baru
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Konfirmasi Kata Sandi Baru",
                    style: textSmallBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Material(
                    child: Obx(
                      () => TextField(
                        obscureText:
                            controller.showConfirmationNewPassword.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.showConfirmationNewPassword.value =
                                  !(controller
                                      .showConfirmationNewPassword.value);
                            },
                            child: Icon(
                              controller.showConfirmationNewPassword.value !=
                                      false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Masukkan Kata Sandi",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),

            // Button atau Tombol "Simpan"
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                width: sizeW,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MaximumBlueColor,
                  ),
                  child: Text(
                    'Simpan',
                    style: textSmallWhite,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // Warna Latar Belakang Halaman
      backgroundColor: Colors.white,
    );
  }
}
