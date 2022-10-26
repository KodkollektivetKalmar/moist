import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<http.Response> postJson() async {
  return http.post(
    Uri.parse('http://localhost:8000/test'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: await rootBundle.loadString('assets/sample.json'),
  );
}
