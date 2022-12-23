import 'package:epasys_app/models/parking_model.dart';
import 'package:epasys_app/services/parking_service.dart';
import 'package:flutter/foundation.dart';

class ParkingProvider with ChangeNotifier {
  List<ParkingModel> _parkings = [];
  List<ParkingModel> _latestParkings = [];
  ParkingModel? _checkOut;

  List<ParkingModel> get parkings => _parkings;
  List<ParkingModel> get latestParkings => _latestParkings;
  ParkingModel get checkOut => _checkOut!;

  set parkings(List<ParkingModel> value) {
    _parkings = value;
    notifyListeners();
  }

  set latestParkings(List<ParkingModel> value) {
    _latestParkings = value;
    notifyListeners();
  }

  set checkOut(ParkingModel value) {
    _checkOut = value;
    notifyListeners();
  }

  Future<bool> getParkings(String token) async {
    try {
      List<ParkingModel> parkings = await ParkingService().getParkings(token);
      _parkings = parkings;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getLatestParkings(String token) async {
    try {
      List<ParkingModel> latestParkings =
          await ParkingService().getLatestParkings(token);
      _latestParkings = latestParkings;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkInAndOut(String noParkir, String status, int helm,
      int idKendaraan, int idUser, String token) async {
    try {
      await ParkingService()
          .checkOut(noParkir, status, helm, idKendaraan, idUser, token);
      List<ParkingModel> parkings = await ParkingService().getParkings(token);
      List<ParkingModel> latestParkings =
          await ParkingService().getLatestParkings(token);
      var checkOut = await ParkingService().getCheckOut(token);
      _parkings = parkings;
      _latestParkings = latestParkings;
      _checkOut = checkOut;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error checkInAndOut in ParkingProvider: $e');
      return false;
    }
  }

  Future<bool> getCheckOut(String token) async {
    try {
      var checkOut = await ParkingService().getCheckOut(token);
      if (checkOut == null) return false;
      _checkOut = checkOut;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error getCheckOut in ParkingProvider: $e');
      return false;
    }
  }
}
