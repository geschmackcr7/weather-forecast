import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: ''
      }
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return null;
    }
  }
}
