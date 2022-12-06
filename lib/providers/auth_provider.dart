import 'package:epasys_app/models/user_model.dart';
import 'package:epasys_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(String nama, String nim, String email, String alamat,
      String password) async {
    try {
      UserModel user =
          await AuthService().register(nama, email, nim, alamat, password);

      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login(String nim, String password) async {
    try {
      UserModel user = await AuthService().login(nim, password);

      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
