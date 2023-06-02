import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Profil",
          style: textAppBarProfile,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Icon
            const SizedBox(
              height: 20,
            ),
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
                    style: textHintProfile,
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
                    style: textHintProfile,
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
                    "Gender",
                    style: textHintProfile,
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
                    style: textHintProfile,
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

            // Textfield Password
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Password",
                    style: textHintProfile,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Material(
                    child: Obx(
                      () => TextField(
                        obscureText: controller.showPassword.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.showPassword.value =
                                  !(controller.showPassword.value);
                            },
                            child: Icon(
                              controller.showPassword.value != false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Masukkan Password",
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
          ],
        ),
      ),
      backgroundColor: Colors.white,

      // Tombol atau Button "Simpan"
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: SizedBox(
          width: sizeW,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: MaximumBlueColor,
            ),
            child: Text(
              'Simpan',
              style: textSimpanProfile,
            ),
          ),
        ),
      ),
    );
  }
}
