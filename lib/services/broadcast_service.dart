import 'dart:convert';

import 'package:epasys_app/models/broadcast_model.dart';
import 'package:epasys_app/shared/config.dart';
import 'package:http/http.dart' as http;

class BroadcastService {
  Future<List<BroadcastModel>> getBroadcasts() async {
    String url = '${SharedConfig().url}/broadcasts';
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<BroadcastModel> broadcasts = [];

      for (var broadcast in data) {
        broadcasts.add(BroadcastModel.fromJson(broadcast));
      }

      return broadcasts;
    } else {
      throw 'Gagal mendapatkan data broadcast';
    }
  }

  Future<List<BroadcastModel>> getBroadcastsByToken(String token) async {
    String url = '${SharedConfig().url}/broadcasts/token';
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<BroadcastModel> broadcasts = [];

      for (var broadcast in data) {
        broadcasts.add(BroadcastModel.fromJson(broadcast));
      }

      return broadcasts;
    } else {
      throw 'Gagal mendapatkan data broadcast';
    }
  }
}
