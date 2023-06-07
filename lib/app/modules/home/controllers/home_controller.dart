import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  final baseUrl = 'https://api-lautanuang.qweersq.my.id';

  Future<void> FetchData() async {
    try {
      var storage = GetStorage();
      var token = storage.read('token');

      var url = '$baseUrl/api/mobile/fisherman-tim';

      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token'
        }, // Mengatur header Authorization dengan token
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
