import 'dart:math';

import 'package:hive/hive.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';

part 'weather_entity.g.dart';

@HiveType(typeId: 1)
class Weather extends HiveObject {
  @HiveField(0)
  final String day;

  @HiveField(1)
  final int temp;

  @HiveField(2)
  final String weatherIcon;

  @HiveField(3)
  final String weatherMessage;

  Weather({
    this.day = 'Monday',
    this.temp = 0,
    this.weatherIcon = '',
    this.weatherMessage = '',
  });
  Weather copyWith({
    String? day,
    int? temp,
    String? weatherIcon,
    String? weatherMessage,
  }) {
    return Weather(
      day: day ?? this.day,
      temp: temp ?? this.temp,
      weatherIcon: weatherIcon ?? this.weatherIcon,
      weatherMessage: weatherMessage ?? this.weatherMessage,
    );
  }
}

class WeatherState {
  int x = Random().nextInt(100);

  List<Weather> weatherData = List.generate(7, (index) => Weather());
  FormSubmissionStatus formStatus = InitialFormStatus();
  WeatherState({
    this.formStatus = const InitialFormStatus(),
  });

  WeatherState copyWith({
    List<Weather>? weatherData,
    FormSubmissionStatus? formStatus,
  }) {
    WeatherState weatherState = WeatherState(
      formStatus: formStatus ?? this.formStatus,
    );
    weatherState.weatherData = weatherData ?? this.weatherData;
    return weatherState;
  }
}

class GenData {
  List<Weather> geneList(dynamic respone) {
    List<Weather> data = [];
    List<String> lday = [
      "Monday",
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    for (int i = 0; i < 7; ++i) {
      int x = Random().nextInt(10);
      x -= 5;
      int temp = respone.main.temp.toInt() - 273 + x;
      Weather weather = Weather();
      weather = weather.copyWith(
        day: lday[i],
        temp: (respone != null) ? temp : 0,
        weatherIcon:
            (respone != null) ? getWeatherIcon(temp).toString() : "!!!",
        weatherMessage: (respone != null) ? getMessage(temp) : "error",
      );
      print("day la thoi tiet");
      print(weather.weatherMessage);
      data.add(weather);
    }
    return data;
  }

  String getWeatherIcon(int temp) {
    if (temp > 25) {
      return '☀️';
    } else if (temp > 20) {
      return '☁️';
    } else if (temp < 10) {
      return '☔️';
    } else {
      return '🌧';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
