import 'dart:convert';

import 'package:epasys_app/models/broadcast_model.dart';
import 'package:http/http.dart' as http;

class BroadcastService {
  String baseUrl = 'https://kelompok17stiebi.website/api';

  Future<List<BroadcastModel>> getBroadcasts() async {
    String url = '$baseUrl/broadcasts';
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
