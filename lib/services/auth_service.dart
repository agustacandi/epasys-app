import 'dart:convert';
import 'dart:io';

import 'package:epasys_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://kelompok17stiebi.website/api';

  Future<UserModel> register(
      String nama,
      String email,
      String nim,
      String alamat,
      String noHp,
      String tanggalLahir,
      String password,
      String passwordConfirm) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'nama': nama,
      'nim': nim,
      'email': email,
      'tanggal_lahir': tanggalLahir,
      'no_telepon': noHp,
      'alamat': alamat,
      'password': password,
      'password_confirmation': passwordConfirm,
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
      print(response.body);
      throw Exception('Failedddd to upload avatar');
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

  Future<UserModel> updateAvatar(File image, String token) async {
    String url = '$baseUrl/users/photo';
    var headers = {'Authorization': token};

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.files.add(await http.MultipartFile.fromPath('avatar', image.path));

    request.headers.addAll(headers);

    var response = await request.send().then(
          (result) => http.Response.fromStream(result).then(
            (response) {
              if (response.statusCode == 200) {
                // print({"asdads", user});
                return response;
              } else {
                // print("Error during connection to server");
                print(response.body);
              }
            },
          ),
        );

    var data = jsonDecode(response!.body)['data'];
    UserModel user = UserModel.fromJson(data);
    return user;
  }

  Future<UserModel> getCurrentUser(String token) async {
    String url = '$baseUrl/user';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw 'Error getCurrent User in AuthService: Gagal mendapatkan data user';
    }
  }

  // Future<UserModel> updateProfile(String token) async {
  //   String url = '$baseUrl/users';
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': token,
  //   };

  //   var body = jsonEncode({'nama': 'aswas'});
  // }
}
