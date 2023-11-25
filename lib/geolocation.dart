import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<String> getAddress(data) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    'Authorization': 'Token 45111fd360e5623c1bb3db94d5938dc4447b7c5e',
  };

  final url = Uri.parse(
      'https://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address');

  final res = await http.post(url, headers: headers, body: json.encode(data));
  final status = res.statusCode;
  if (status != 200) throw Exception('http.post error: statusCode= $status');

  return res.body;
}
