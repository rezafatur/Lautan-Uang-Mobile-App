import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ApiService {
  // URL API Lautan Uang
  final baseUrl = 'https://api-lautanuang.qweersq.my.id';

  // Sistem Login atau Masuk
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    // URL Login Investor
    var url = '$baseUrl/api/investor/login';

    // Permintaan HTTP POST ke URL
    var response = await http.post(
      Uri.parse(url),
      body: {
        'email': email,
        'password': password,
      },
    );

    // ignore: unnecessary_null_comparison
    if (response != null) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success'] == true &&
          jsonResponse['access_token'] != null) {
        // Jika Berhasil Login, Maka Simpan Token di GetStorage
        var token = jsonResponse['access_token'];
        GetStorage storage = GetStorage();
        await storage.write('token', token);
      }
      return jsonResponse;
    } else {
      return {'message': 'Server error'};
    }
  }

  // Sistem Register atau Daftar
  Future<Map<String, dynamic>> registerUser(String name, String email,
      String password, String confirmPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/investor/register'),
      body: {
        'name': name,
        'email': email,
        'password': password,
        'c_password': confirmPassword,
      },
      headers: {
        'Accept': 'application/json',
      },
    );

    // ignore: unnecessary_null_comparison
    if (response != null) {
      return jsonDecode(response.body);
    } else {
      return {'message': 'Server error'};
    }
  }

  // Sistem mengambil data semua nelayan
  Future<http.Response> fetchFishermanTeams(String token) async {
    try {
      // API Fisherman Tim untuk Investor
      var url = '$baseUrl/api/mobile/fisherman-tim';

      // Permintaan HTTP GET ke URL
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      return response;
    } catch (e) {
      print(e);
      return http.Response('Error', 500);
    }
  }
}
