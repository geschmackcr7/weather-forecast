import 'package:dio/dio.dart' as dio;
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forecast/src/core/network/weather_api_service.dart';

class WeatherRepository {
  Future<dynamic> getWeatherData() async {
    final Map<String, dynamic> temp = {};
    try {
      WeatherApiService weatherApiService = WeatherApiService(dio.Dio());
      final response = await weatherApiService.getWeatherData(temp);
      if (response != null) {
        return response;
      } else {
        throw Exception('ko tim thay du lieu !');
      }
    } catch (e) {
      print(e);
    }
    // String url =
    //     '${dotenv.get('OPEN_WEATHER_MAP_URL')}?q=hanoi&appid=${dotenv.get('API_WEATHER_KEY')}&units=metric';
    // try {
    //   http.Response response = await http.get(Uri.parse(url), headers: {
    //     HttpHeaders.authorizationHeader: dotenv.get('API_WEATHER_KEY'),
    //   });
    //   if (response.statusCode == 200) {
    //     var data = response.body;
    //     print(data);
    //     return jsonDecode(data);
    //   } else
    //     return null;
    // } catch (e) {
    //   print(e);
    //   return null;
    // }
  }
}
