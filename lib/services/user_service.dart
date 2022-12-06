import 'dart:convert';
import 'dart:io';

import 'package:epasys_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  String baseUrl = 'https://kelompok17stiebi.website/api';

  Future<UserModel> updateAvatar(File image, String id, String token) async {
    String url = '$baseUrl/user/photo?id=$id';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = {
      'avatar': image.path,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.avatar = data['avatar'];
      return user;
    } else {
      throw Exception('Failed to upload avatar');
    }
  }
}
