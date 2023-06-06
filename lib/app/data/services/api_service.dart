import 'dart:convert';
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
      return jsonDecode(response.body);
    } else {
      return {'message': 'Server error'};
    }
  }
}
