import 'package:flutter/material.dart';
import 'package:weather_forecast/screens/loading_screen.dart';
import 'package:weather_forecast/screens/login_screen.dart';
import 'package:weather_forecast/screens/signup_screen.dart';
import 'package:weather_forecast/screens/weather_forecast_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signUp': (context) => const SignupScreen(),
        '/weatherForecast': (context) => const WeatherForecastScreen(),
        //'/loadingScreen': (context) => LoadingScreen(),
      },
    );
  }
}
