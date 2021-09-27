import 'package:flutter/material.dart';
import 'package:weather_forecast/screens/login_screen.dart';
import 'package:weather_forecast/screens/registration_screen.dart';
import 'package:weather_forecast/screens/weather_forecast_screen.dart';
import 'package:weather_forecast/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WeatherForecastScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
