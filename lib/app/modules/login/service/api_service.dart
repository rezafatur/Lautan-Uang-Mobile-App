import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // final baseUrl = 'http://localhost:8000/api/investor';

  // Android Emulator
  // final baseUrl = 'http://10.0.2.2:8000/api/investor';

  // API Lautan Uang
  final baseUrl = 'https://api-lautanuang.qweersq.my.id';

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    // URL Testing
    var url = '$baseUrl/api/auth/login';

    // URL Login Investor
    // var url = '$baseUrl/api/investor/login';

    var response = await http.post(Uri.parse(url), body: {
      'email': email,
      'password': password,
    });

    if (response != null) {
      return jsonDecode(response.body);
    } else {
      return {'message': 'Server error'};
    }
  }
}
