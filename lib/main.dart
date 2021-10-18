import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/src/domain/repositories/weather_box.dart';
import 'package:weather_forecast/src/injector.dart';
import 'package:weather_forecast/src/presentation/blocs/login_bloc.dart';
import 'package:weather_forecast/src/presentation/blocs/signup_bloc.dart';
import 'package:weather_forecast/src/presentation/blocs/weather_bloc.dart';
import 'package:weather_forecast/src/presentation/screens/login_screen.dart';
import 'package:weather_forecast/src/presentation/screens/signup_screen.dart';
import 'package:weather_forecast/src/presentation/screens/weather_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');

  configureDependencies();

  WeatherBox weatherBox = GetIt.instance<WeatherBox>();
  await weatherBox.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(),
        ),
      ],
      child: MaterialApp(
        initialRoute: token == null ? '/login' : '/weatherForecast',
        routes: {
          '/login': (context) => LoginScreen(),
          '/signUp': (context) => SignupScreen(),
          '/weatherForecast': (context) => WeatherForecastScreen(),
        },
      ),
    ),
  );
}
