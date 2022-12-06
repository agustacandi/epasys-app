import 'dart:convert';

import 'package:epasys_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://kelompok17stiebi.website/api';

  Future<UserModel> register(String nama, String email, String nim,
      String alamat, String password) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'nama': nama,
      'nim': nim,
      'email': email,
      'alamat': alamat,
      'password': password,
      'password_confirmation': password,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['token']}';
      return user;
    } else {
      throw Exception('Failed to register account');
    }
  }

  Future<UserModel> login(String nim, String password) async {
    var url = '$baseUrl/login';
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'nim': nim,
      'password': password,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['token']}';
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<bool> logout(String token) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.post(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
