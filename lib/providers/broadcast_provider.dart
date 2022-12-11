import 'package:epasys_app/models/broadcast_model.dart';
import 'package:epasys_app/services/broadcast_service.dart';
import 'package:flutter/material.dart';

class BroadcastProvider with ChangeNotifier {
  List<BroadcastModel> _broadcasts = [];

  List<BroadcastModel> get broadcasts => _broadcasts;

  set broadcasts(List<BroadcastModel> broadcasts) {
    _broadcasts = broadcasts;
    notifyListeners();
  }

  Future<void> getBroadcasts() async {
    try {
      List<BroadcastModel> broadcasts =
          await BroadcastService().getBroadcasts();

      _broadcasts = broadcasts;
      notifyListeners();
    } catch (e) {
      print('Error getBroadcasts in BroadcastProvider: $e');
    }
  }
}
