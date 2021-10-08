import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dataset/weather_data.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  WeatherData weatherData = WeatherData();

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
      body: FutureBuilder(
        future: weatherData.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: weatherData.day.length,
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
                          Text(weatherData.day[index],
                              style: TextStyle(fontSize: 25)),
                          SizedBox(
                            width: 20,
                          ),
                          Text('${weatherData.temp[index]}°C',
                              style: TextStyle(fontSize: 25)),
                          SizedBox(
                            width: 20,
                          ),
                          Text(weatherData.weatherIcon[index],
                              style: TextStyle(fontSize: 25)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        weatherData.weatherMessage[index],
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          } else {
            return CupertinoActivityIndicator();
          }
        },
      ),
    );
  }
}
