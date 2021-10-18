import 'package:get_it/get_it.dart';
import 'package:weather_forecast/src/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/domain/repositories/auth_repository.dart';
import 'package:weather_forecast/src/domain/repositories/weather_box.dart';
import 'package:weather_forecast/src/domain/repositories/weather_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  getIt.registerSingleton<WeatherRepository>(WeatherRepository());
  getIt.registerSingleton<AuthRepository>(AuthRepository());
  getIt.registerSingleton<WeatherBox>(WeatherBox());
  getIt.registerSingleton<GenData>(GenData());
}
