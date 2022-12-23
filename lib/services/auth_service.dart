import 'dart:convert';
import 'dart:io';
import 'package:epasys_app/models/user_model.dart';
import 'package:epasys_app/shared/config.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserModel> register(
      String nama,
      String email,
      String nim,
      String alamat,
      String noHp,
      String tanggalLahir,
      String password,
      String passwordConfirm) async {
    var url = '${SharedConfig().url}/register';
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
    try {
      var url = '${SharedConfig().url}/login';
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        'nim': nim,
        'password': password,
      });

      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['token']}';
      return user;
    } catch (e) {
      throw Exception('Failed to login account: $e');
    }
  }

  Future<bool> logout(String token) async {
    var url = '${SharedConfig().url}/logout';
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
    String url = '${SharedConfig().url}/users/photo';
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
    String url = '${SharedConfig().url}/user';
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

  Future<UserModel> updateProfile(
    String nama,
    String nim,
    String tanggalLahir,
    String alamat,
    String noHp,
    String email,
    String token,
  ) async {
    String url = '${SharedConfig().url}/users';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.headers.addAll(headers);

    if (nama != '') {
      request.fields['nama'] = nama;
    }
    if (nim != '') {
      request.fields['nim'] = nim;
    }
    if (tanggalLahir != '') {
      request.fields['tanggal_lahir'] = tanggalLahir;
    }
    if (alamat != '') {
      request.fields['alamat'] = alamat;
    }
    if (noHp != '') {
      request.fields['no_telepon'] = noHp;
    }
    if (email != '') {
      request.fields['email'] = email;
    }

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

  Future<bool> changePasswordUser(
      String password, String confirmPassword, String token) async {
    String url = '${SharedConfig().url}/users/password';
    var headers = {
      'Authorization': token,
    };
    var body = {
      'password': password,
      'password_confirmation': confirmPassword,
    };

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
