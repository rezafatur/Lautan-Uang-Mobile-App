import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/services/api_service.dart';

class AllProvinceController extends GetxController {
  final ApiService apiService = ApiService();

  // List Tim Nelayan
  RxList<Map<String, dynamic>> fishermanTeams = <Map<String, dynamic>>[].obs;

  // Memuat data aktif
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Mengambil Token
      var storage = GetStorage();
      var token = storage.read('token');

      // Memuat data aktif
      isLoading.value = true;

      // Permintaan ke API Service
      var response = await apiService.fetchFishermanTeams(token);

      print(response.body);
      if (response.statusCode == 200) {
        // Testing data = null atau kosong
        // var data = null;

        // Menguraikan data JSON ke variabel data
        var data = json.decode(response.body);
        fishermanTeams.value = List<Map<String, dynamic>>.from(data);
        print(data);
      }

      // Memuat data selesai
      isLoading.value = false;
    } catch (e) {
      print(e);

      // Memuat data selesai
      isLoading.value = false;
    }
  }
}
