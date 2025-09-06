import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.servicebox.com/v1";

  Future<dynamic> login(String phone, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      body: {"phone": phone, "password": password},
    );
    return jsonDecode(response.body);
  }
}
