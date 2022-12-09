import 'dart:convert';
import 'package:epasys_app/models/vechile_model.dart';
import 'package:http/http.dart' as http;

class VerchileService {
  String baseUrl = 'https://kelompok17stiebi.website/api';

  // Future<List<VechileModel>> getVechiles(String token) async {
  //   String url = '$baseUrl/vechiles';

  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': token,
  //   };

  //   var response = await http.get(Uri.parse(url), headers: headers);

  //   print(response.body);

  //   if (response.statusCode == 200) {}
  // }
}
