import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepository {
  Future<http.Response> login(String email, String password) async {
    return http.post(
      Uri.parse("http://127.0.0.1:8000/api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
  }
}
