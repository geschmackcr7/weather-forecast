import 'package:flutter/material.dart';
import '../dataset/weather_data.dart';

class WeatherForecastScreen extends StatefulWidget {
  WeatherForecastScreen({this.weatherDataset});
  final weatherDataset;
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  List<String> day = [];
  List<int> temp = [];
  List<String> weatherIcon = [];
  List<String> weatherMessage = [];

  @override
  void initState() {
    super.initState();
    getDataWeather(widget.weatherDataset);
  }

  void getDataWeather(dynamic weatherData) {
    setState(() {
      for (int i = 0; i < weatherData.day.length; i++) {
        day.add(weatherData.day[i]);
        temp.add(weatherData.temp[i]);
        weatherIcon.add(weatherData.weatherIcon[i]);
        weatherMessage.add(weatherData.weatherMessage[i]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "The weather forecast in Hanoi",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: day.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.lightBlueAccent,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(day[index], style: TextStyle(fontSize: 25)),
                    SizedBox(
                      width: 20,
                    ),
                    Text('${temp[index]}°C', style: TextStyle(fontSize: 25)),
                    SizedBox(
                      width: 20,
                    ),
                    Text(weatherIcon[index], style: TextStyle(fontSize: 25)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  weatherMessage[index],
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
