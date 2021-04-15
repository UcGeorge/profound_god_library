import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Client {
  // ignore: non_constant_identifier_names
  final BASE;

  // ignore: non_constant_identifier_names
  Client({this.BASE = '127.0.0.1:5000'});

  // ignore: non_constant_identifier_names
  Future<bool> is_connected({base = ''}) async {
    String endpoint = '/hello';

    // http://127.0.0.1:5000/user/{username}
    var url = Uri.http(base != '' ? base : BASE, endpoint);

    // Await the http get response, then return true if the status code is 200.
    var response = await http.get(url);
    return response.statusCode == 200 ? true : false;
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> get_user(String username) async {
    String endpoint = '/user/$username';

    // http://127.0.0.1:5000/user/{username}
    var url = Uri.http(BASE, endpoint);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return null;
    }

    return convert.jsonDecode(response.body);
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> get_novel(String novelname) async {
    String endpoint = '/novels';
    Map<String, dynamic> data = {'name': novelname == 'all' ? null : novelname};

    // http://127.0.0.1:5000/novels?name=${novelname == 'all' ? null : novelname}
    var url = Uri.http(
      BASE,
      endpoint,
      data,
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return null;
    }

    return convert.jsonDecode(response.body);
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, dynamic>> add_user(String username) async {
    String endpoint = '/user/$username';

    // http://127.0.0.1:5000/user/{username}
    var url = Uri.http(BASE, endpoint);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url);
    if (response.statusCode != 201) {
      return null;
    }

    return convert.jsonDecode(response.body);
  }
}

enum NetworkException { NOT_FOUND, ALREADY_EXISTS }
