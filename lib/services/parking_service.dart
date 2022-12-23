import 'dart:convert';

import 'package:epasys_app/models/parking_model.dart';
import 'package:epasys_app/shared/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ParkingService extends ChangeNotifier {
  Future<List<ParkingModel>> getParkings(String token) async {
    String url = '${SharedConfig().url}/parkings';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ParkingModel> parkings = [];
      for (var parking in data) {
        parkings.add(ParkingModel.fromJson(parking));
      }
      return parkings;
    } else {
      throw 'Error getParkings in ParkingService';
    }
  }

  Future<List<ParkingModel>> getLatestParkings(String token) async {
    String url = '${SharedConfig().url}/parkings/latest';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ParkingModel> parkings = [];
      for (var parking in data) {
        parkings.add(ParkingModel.fromJson(parking));
      }
      return parkings;
    } else {
      throw 'Error getParkings in ParkingService';
    }
  }

  Future<dynamic> getCheckOut(String token) async {
    String url = '${SharedConfig().url}/parkings/out';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      if (data == null) {
        return null;
      }
      ParkingModel checkOut = ParkingModel.fromJson(data);
      return checkOut;
    } else {
      throw 'Error getParkings in ParkingService';
    }
  }

  Future<bool> checkIn(
    String noParkir,
    String status,
    int helm,
    int idUser,
    int idKendaraan,
    String token,
  ) async {
    String url = '${SharedConfig().url}/parkings';
    var headers = {
      'Authorization': token,
    };
    var body = {
      'nomor_parkir': noParkir,
      'status': status,
      'helm': helm.toString(),
      'is_expired': '1',
      'id_kendaraan': idKendaraan.toString(),
      'id_user': idUser.toString(),
    };

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 201) {
      return true;
    } else {
      throw 'Error checkIn in ParkingService: ${response.reasonPhrase}';
    }
  }

  Future<bool> checkOut(
    String noParkir,
    String status,
    int helm,
    int idUser,
    int idKendaraan,
    String token,
  ) async {
    String url = '${SharedConfig().url}/parkings';
    var headers = {
      'Authorization': token,
    };
    var body = {
      'nomor_parkir': noParkir,
      'status': status,
      'helm': helm.toString(),
      'id_kendaraan': idKendaraan.toString(),
      'id_user': idUser.toString(),
    };

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 201) {
      return true;
    } else {
      throw 'Error checkIn in ParkingService';
    }
  }

  Future<bool> confirmParking(
    String noParkir,
    int idKendaraan,
    String token,
  ) async {
    String url = '${SharedConfig().url}/parkings';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = {
      'nomor_parkir': noParkir,
      'id_kendaraan': idKendaraan,
    };

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 201) {
      return true;
    } else {
      throw 'Error checkIn in ParkingService';
    }
  }
}
