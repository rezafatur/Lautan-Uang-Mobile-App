import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lautan_uang/app/modules/home/views/home_view.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final pageController = PageController();
  @override
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    // Membuat warna gradient menjadi lebih halus
    Paint.enableDithering = true;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: sizeH,
            maxWidth: sizeW,
          ),
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
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/LautanUangLogo.png",
                        height: sizeH * 0.25,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
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
                        Image.asset(
                          "assets/images/Login.png",
                          height: sizeH * 0.3,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
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
                            Get.off(
                              HomeView(),
                            );
                          },
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                              fontSize: 14,
                            ),
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
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Belum punya akun?",
                              style: loginBelumPunyaAkun,
                            ),
                            TextButton(
                              onPressed: () {},
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
