import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({required this.temperature, required this.weatherIcon});
  final int temperature;
  final String weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monday'),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: Container(
        color: Colors.lightGreenAccent,
      ),
    );
  }
}
