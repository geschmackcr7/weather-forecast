import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_forecast/src/core/network/responses/weather_response.dart';

part 'weather_api_service.g.dart';

@RestApi(
    baseUrl:
        'https://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=18a8967084c88b2a4b6e0e5045e5ac03')
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );

    return _WeatherApiService(dio, baseUrl: baseUrl);
  }

  @GET('')
  Future<WeatherResponse> getWeatherData(@Body() Map<String, dynamic> body);
}
