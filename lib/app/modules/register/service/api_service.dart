import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // final baseUrl = 'http://localhost:8000/api/investor';

  // Android Emulator
  // final baseUrl = 'http://10.0.2.2:8000/api/investor';

  // API Lautan Uang
  final baseUrl = 'https://api-lautanuang.qweersq.my.id';

  Future<Map<String, dynamic>> registerUser(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/investor/register'),
      body: {'name': name, 'email': email, 'password': password},
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response != null) {
      return jsonDecode(response.body);
    } else {
      return {'message': 'Server error'};
    }
  }
}
