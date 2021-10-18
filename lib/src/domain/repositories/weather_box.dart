import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_forecast/src/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';

const boxName = "weather";

class WeatherBox {
  init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(WeatherAdapter());
    await Hive.openBox(boxName);
  }

  add(WeatherState val) {
    var box = Hive.box(boxName);
    box.put("list", val.weatherData);
    if (val.formStatus == SubmissionSuccess())
      box.put("status", "ok");
    else
      box.put("status", "no");
  }

  WeatherState get() {
    var box = Hive.box(boxName);
    List<Weather> records = [];
    var list = box.get("list");
    var status = box.get("status");
    if (list != null) {
      for (final r in list) {
        records.add(Weather(
            day: r.day,
            temp: r.temp,
            weatherIcon: r.weatherIcon,
            weatherMessage: r.weatherMessage));
      }
    }
    WeatherState weatherState = WeatherState(
        formStatus: status == "ok" ? SubmissionSuccess() : InitialFormStatus());
    weatherState.weatherData = records;
    return weatherState;
  }

  delete() {
    var box = Hive.box(boxName);
    box.delete("list");
    box.delete("status");
  }
}
