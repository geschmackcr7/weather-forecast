import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherRepository {
  Future<dynamic> getWeatherData() async {
    String url =
        '${dotenv.get('OPEN_WEATHER_MAP_URL')}?q=hanoi&appid=${dotenv.get('API_WEATHER_KEY')}&units=metric';
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader: dotenv.get('API_WEATHER_KEY'),
      });
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
