import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lautan_uang/app/modules/login/views/login_view.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  @override
  final RegisterController controller = Get.put(RegisterController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      // Navigasi Bagian Atas
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.offAll(
              LoginView(),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: PrussianBlueColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Buat Akun
              Text(
                "Buat Akun",
                style: textExtraLargePrussianBlueBold,
              ),
              const SizedBox(
                height: 20,
              ),

              // Gambar Buat Akun
              Center(
                child: Image.asset(
                  "assets/images/Register.png",
                  height: sizeH * 0.3,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Textfield untuk Memasukkan Nama
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AzureishWhiteColor,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: PrussianBlueColor,
                  ),
                  hintText: "Nama",
                  hintStyle: const TextStyle(
                    color: PrussianBlueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Textfield untuk Memasukkan Email
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AzureishWhiteColor,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: PrussianBlueColor,
                  ),
                  hintText: "Email",
                  hintStyle: const TextStyle(
                    color: PrussianBlueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Textfield untuk Memasukkan Kata Sandi
              Material(
                child: Obx(
                  () => TextField(
                    controller: passwordController,
                    obscureText: controller.showPassword.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AzureishWhiteColor,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: PrussianBlueColor,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.showPassword.value =
                              !(controller.showPassword.value);
                        },
                        child: Icon(
                          controller.showPassword.value != false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: PrussianBlueColor,
                        ),
                      ),
                      hintText: "Kata Sandi",
                      hintStyle: const TextStyle(
                        color: PrussianBlueColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Textfield untuk Konfirmasi Kata Sandi
              Material(
                child: Obx(
                  () => TextField(
                    controller: confirmPasswordController,
                    obscureText: controller.showConfirmPassword.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AzureishWhiteColor,
                      prefixIcon: const Icon(
                        Icons.lock_reset,
                        color: PrussianBlueColor,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.showConfirmPassword.value =
                              !(controller.showConfirmPassword.value);
                        },
                        child: Icon(
                          controller.showConfirmPassword.value != false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: PrussianBlueColor,
                        ),
                      ),
                      hintText: "Konfirmasi Kata Sandi",
                      hintStyle: const TextStyle(
                        color: PrussianBlueColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Button atau Tombol "Daftar"
              ElevatedButton(
                onPressed: () {
                  controller.registerUser(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                      confirmPasswordController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PrussianBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeW * 0.2,
                  ),
                ),
                child: Text(
                  "Daftar",
                  style: textLargeAzureWhite,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // Pesan Error
              Obx(
                () => Text(
                  controller.errorMessage.value,
                  style: textErrorMessageBold,
                ),
              ),

              // Jika Sudah Punya Akun, Kembali ke Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun?",
                    style: textSmallBlack,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(
                        LoginView(),
                      );
                    },
                    child: Text(
                      "Masuk",
                      style: textSmallPrussianBlueBold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Warna Background atau Latar Belakang
      backgroundColor: Colors.white,
    );
  }
}
