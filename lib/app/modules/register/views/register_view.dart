import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lautan_uang/app/modules/home/views/home_view.dart';
import 'package:lautan_uang/app/modules/login/views/login_view.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  final pageController = PageController();
  @override
  final RegisterController controller = Get.put(RegisterController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.offAll(
              LoginView(),
            );
          },
          icon: Icon(
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
              Text(
                "Buat Akun",
                style: daftarHeader,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  "assets/images/Register.png",
                  height: sizeH * 0.3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                  prefixIcon: Icon(
                    Icons.person,
                    color: PrussianBlueColor,
                  ),
                  hintText: "Nama",
                  hintStyle: TextStyle(
                    color: PrussianBlueColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                  prefixIcon: Icon(
                    Icons.email,
                    color: PrussianBlueColor,
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: PrussianBlueColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                      prefixIcon: Icon(
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
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: PrussianBlueColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.registerUser(nameController.text,
                      emailController.text, passwordController.text);
                },
                child: Text(
                  "Daftar",
                  style: daftarButton,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: PrussianBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeW * 0.2,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Text(
                  controller.errorMessage.value,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun?",
                    style: daftarSudahPunyaAkun,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(
                        LoginView(),
                      );
                    },
                    child: Text(
                      "Masuk",
                      style: daftarLogin,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
