import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String url;
  final api_key = "";
  Network(this.url);

  Future<dynamic> getData() async {
    // ignore: non_constant_identifier_names
    var DecodedData;
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      DecodedData = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
    return DecodedData;
  }
}
