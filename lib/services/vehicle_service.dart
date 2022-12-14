import 'dart:convert';
import 'package:epasys_app/models/vehicle_model.dart';
import 'package:http/http.dart' as http;

class VehicleService {
  String baseUrl = 'https://kelompok17stiebi.website/api';

  Future<List<VehicleModel>> getVechiles(int id) async {
    String url = '$baseUrl/vechiles?id=$id';

    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<VehicleModel> vehicles = [];
      for (var vehicle in data) {
        vehicles.add(VehicleModel.fromJson(vehicle));
      }
      return vehicles;
    } else {
      throw 'Error getVechiles in VechileService';
    }
  }
}
