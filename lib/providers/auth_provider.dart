import 'dart:io';

import 'package:epasys_app/models/user_model.dart';
import 'package:epasys_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel get user => _user!;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      String nama,
      String nim,
      String email,
      String alamat,
      String noHp,
      String tanggalLahir,
      String password,
      String passwordConfirm) async {
    try {
      UserModel user = await AuthService().register(nama, email, nim, alamat,
          noHp, tanggalLahir, password, passwordConfirm);

      _user = user;
      notifyListeners();
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
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateAvatar(File image, String token) async {
    try {
      UserModel user = await AuthService().updateAvatar(image, token);

      print(user);

      _user!.avatar = user.avatar;
      notifyListeners();

      print(_user);

      return true;
    } catch (e) {
      print(e);
      print('errornya di updateAvatar provider');
      return false;
    }
  }

  Future<void> getCurrentUser(String token) async {
    try {
      UserModel user = await AuthService().getCurrentUser(token);
      print(user);
      _user = user;
      _user!.token = token;
      notifyListeners();
    } catch (e) {
      print('Error getCurrentUser in AuthProvider : $e');
    }
  }

  Future<bool> updateProfile(
    String nama,
    String nim,
    String tanggalLahir,
    String alamat,
    String noHp,
    String email,
    File? image,
    String token,
  ) async {
    try {
      UserModel user = await AuthService().updateProfile(
          nama, nim, tanggalLahir, alamat, noHp, email, image, token);

      _user = user;
      _user!.token = token;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error updateProfile in AuthProvider : $e');
      return false;
    }
  }
}
