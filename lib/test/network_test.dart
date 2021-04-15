//import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const BASE = 'http://127.0.0.1:5000';
String endpoint = '/user/uche';

void main() async {
  var url = Uri.http(BASE, endpoint);
  var response = await http.get(url);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
