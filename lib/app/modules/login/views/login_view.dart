import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lautan_uang/app/modules/register/views/register_view.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final pageController = PageController();
  @override
  final LoginController controller = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    // Membuat warna gradient menjadi lebih halus
    Paint.enableDithering = true;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: sizeH,
            maxWidth: sizeW,
          ),

          // Gradient untuk Background atau Latar Belakang
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp,
              colors: [
                PrussianBlueColor,
                DarkCeruleanColor,
              ],
            ),
          ),

          // Kolom Gambar, Email, Password, Tombol "Masuk", dan Daftar
          child: Column(
            children: [
              // Logo Lautan Uang
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: sizeW * 0.3,
                        height: sizeH * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          "assets/icons/LautanUangLogo.png",
                          height: sizeH * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Login Section
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(100),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Ilustrasi Login
                        Image.asset(
                          "assets/images/Login.png",
                          height: sizeH * 0.25,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Textfield Email
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

                        // Textfield Password atau Kata Sandi
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

                        // Button atau Tombol "Masuk"
                        ElevatedButton(
                          onPressed: () {
                            controller.loginUser(
                                emailController.text, passwordController.text);
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
                            "Masuk",
                            style: loginButton,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Pesan Error
                        Obx(
                          () => Text(
                            controller.errorMessage.value,
                            style: loginError,
                          ),
                        ),

                        // Button atau Tombol "Daftar"
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Belum punya akun?",
                              style: loginBelumPunyaAkun,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(
                                  RegisterView(),
                                );
                              },
                              child: Text(
                                "Daftar",
                                style: loginDaftar,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
