import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'http://localhost:8000/api/investor';

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    var url = '$baseUrl/login';

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
