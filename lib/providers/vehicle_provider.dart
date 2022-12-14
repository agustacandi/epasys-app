import 'package:epasys_app/models/vehicle_model.dart';
import 'package:epasys_app/services/vehicle_service.dart';
import 'package:flutter/foundation.dart';

class VehicleProvider with ChangeNotifier {
  List<VehicleModel> _vehicles = [];

  List<VehicleModel> get vehicles => _vehicles;

  set vehicles(List<VehicleModel> vehicles) {
    _vehicles = vehicles;
  }

  Future<bool> getVehicles(int id) async {
    try {
      List<VehicleModel> vehicles = await VehicleService().getVechiles(id);
      _vehicles = vehicles;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error getVechiles in VechileProvider: $e');
      return false;
    }
  }
}
