import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // API Lautan Uang
  final baseUrl = 'https://api-lautanuang.qweersq.my.id';

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    // URL Login Investor
    var url = '$baseUrl/api/investor/login';

    // Membuat permintaan HTTP POST ke URL
    var response = await http.post(
      Uri.parse(url),
      body: {
        'email': email,
        'password': password,
      },
    );

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
}
