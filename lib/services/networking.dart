import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper({this.url});

  Future getData() async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var data = response.body;
        print(data);
        return jsonDecode(data);
      } else {
        print(response.body);
        return response.body;
      }
    } catch (e) {
      print("parsing exception $e");
      return e;
    }
  }
}
