import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_forecast/src/core/network/api_service.dart';

class AuthRepository {
  Future<dynamic> login(String email, String password) async {
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
    };
    // String url =
    //     dotenv.get('API_AUTH_HOST') + dotenv.get('API_AUTH_SIGNIN_PATH');
    try {
      // final response = await http.post(
      //   Uri.parse(url),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json',
      //     'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
      //     'X-Consumer-Username': 'acc.user.1593502251879746903',
      //     'x-sha1-fingerprint': dotenv.get('API_KEY'),
      //   },
      //   body:
      //       jsonEncode(<String, String>{'email': email, 'password': password}),
      // );
      ApiService apiService = ApiService(dio.Dio());
      final response = await apiService.login(loginData);
      print(response);
      // ignore: unnecessary_null_comparison
      if (true) {
        var data = response;
        print(data);
        return data;
      } else {
        throw Exception('Valid');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signup(
      String email, String password, String confirmPassword) async {
    if (password != confirmPassword) throw Exception('mat khau ko trung nhau');
    String url =
        dotenv.get('API_AUTH_HOST') + dotenv.get('API_AUTH_SIGNUP_PATH');
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'x-sha1-fingerprint': dotenv.get('API_KEY'),
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        throw Exception('Account existed !');
      }
    } catch (e) {
      throw e;
    }
  }
}
