import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../controllers/edit_personal_data_controller.dart';

class EditPersonalDataView extends GetView<EditPersonalDataController> {
  const EditPersonalDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditPersonalDataController());
    SizeConfig().init(context);
    double sizeH = SizeConfig.screenHeight!;
    double sizeW = SizeConfig.screenWidth!;

    // Pilih Tanggal Lahir Investor
    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate.value ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != controller.selectedDate.value) {
        controller.selectedDate.value = picked;
      }
    }

    return Scaffold(
      // Navigasi Bagian Atas
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Edit Data Diri",
          style: textLargeBlackBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar Data Diri
            Center(
              child: Image.asset(
                "assets/images/PersonalData.png",
                fit: BoxFit.cover,
                height: sizeH * 0.25,
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

            // Textfield Tempat Lahir
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Tempat Lahir",
                    style: textSmallBlack,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Tempat Lahir",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Tanggal Lahir
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Tanggal Lahir",
                    style: textSmallBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: controller.selectedDate.value != null
                              ? controller.dateFormatter
                                  .format(controller.selectedDate.value!)
                              : "Pilih Tanggal Lahir",
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

            // Textfield Nomor Induk Kependudukan (NIK)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "NIK",
                    style: textSmallBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan NIK",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Nomor Pokok Wajib Pajak (NPWP)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "NPWP",
                    style: textSmallBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan NPWP",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Textfield Bank
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    "Bank",
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
                      hintText: controller.selectedBank != null
                          ? "Pilih Bank"
                          : "Pilih Bank",
                    ),
                    value: controller.selectedBank,
                    items: const [
                      DropdownMenuItem(
                        value: "BCA",
                        child: Text(
                          "BCA",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "BNI",
                        child: Text(
                          "BNI",
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      controller.selectedBank = value!;
                    },
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
