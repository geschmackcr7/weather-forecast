import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';
import 'package:weather_forecast/src/core/network/responses/login_response.dart';

part 'api_service.g.dart';

// done this file

@RestApi(baseUrl: 'https://stage-gw.skyx.vn/authentication')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: 30000,
        connectTimeout: 30000,
        contentType: 'application/json',
        headers: {
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'X-Consumer-Username': 'acc.user.1593502251879746903',
          'x-sha1-fingerprint': dotenv.get('API_KEY'),
        });

    return _ApiService(dio, baseUrl: baseUrl);
  }

  // Login Service
  @POST('/sign_in')
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);
}
