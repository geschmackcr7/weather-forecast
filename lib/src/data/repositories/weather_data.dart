import '../../core/services/weather_model.dart';

class WeatherData {
  List<String> day = <String>[
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  List<int> temp = [];
  List<String> weatherIcon = [];
  List<String> weatherMessage = [];

  Future<void> init() async {
    WeatherModel weather = WeatherModel();
    var data = await weather.getWeatherData();
    if (data == null) {
      for (int i = 0; i < 7; i++) {
        temp.add(0);
        weatherIcon.add('!!!');
        weatherMessage.add('error');
      }
    } else {
      var temperature = data['main']['temp'];
      var condition = data['weather'][0]['id'];
      for (int i = 0; i < 7; i++) {
        temp.add(temperature.toInt() + i % 4);
        weatherMessage.add(weather.getMessage(temperature.toInt() + i % 4));
        weatherIcon.add(weather.getWeatherIcon(condition).toString());
      }
    }
  }
}
