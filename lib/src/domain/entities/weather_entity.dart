import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';

class Weather {
  final String day;
  final int temp;
  final String weatherIcon;
  final String weatherMessage;
  Weather({
    this.day = "Monday",
    this.temp = 0,
    this.weatherIcon = "",
    this.weatherMessage = "",
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

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition <= 805) {
      return '☀️';
      // } else if (condition <= 804) {
      //   return '☁️';
    } else {
      return '🤷‍';
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

class WeatherState {
  List<Weather> weatherData = List.generate(7, (index) => Weather());
  final FormSubmissionStatus formStatus;
  WeatherState({
    this.formStatus = const InitialFormStatus(),
  });

  WeatherState copyWith({
    dynamic respone,
    FormSubmissionStatus? formStatus,
  }) {
    WeatherState weatherState = WeatherState(
      formStatus: formStatus ?? this.formStatus,
    );
    if (respone != null) weatherState.weatherData = geneList(respone);
    return weatherState;
  }

  List<Weather> geneList(dynamic respone) {
    print(respone);
    List<Weather> data = [];
    for (int i = 0; i < 7; ++i) {
      Weather weather = Weather();
      weather.copyWith(
        day: "Monday",
        temp: respone ? respone['main']['temp'].toInt() : 0,
        weatherIcon: respone
            ? weather.getWeatherIcon(respone['weather'][0]['id']).toString()
            : "!!!",
        weatherMessage: respone
            ? weather.getMessage(respone['main']['temp'].toInt())
            : "error",
      );
      data.add(weather);
    }
    return data;
  }
}
