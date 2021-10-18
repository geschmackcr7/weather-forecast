import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/src/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/domain/events/login_event.dart';
import 'package:weather_forecast/src/domain/events/weather_event.dart';
import 'package:weather_forecast/src/domain/repositories/weather_box.dart';
import 'package:weather_forecast/src/presentation/blocs/login_bloc.dart';
import 'package:weather_forecast/src/presentation/blocs/weather_bloc.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherGetted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(width: 20),
        backgroundColor: Colors.red,
        title: Text(
          "The weather forecast in Hanoi",
        ),
        actions: <Widget>[
          _buttonLogout(),
        ],
      ),
      body: _weatherForm(),
    );
  }

  Widget _buttonLogout() {
    return IconButton(
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        context.read<LoginBloc>().add(Logout());
        WeatherBox weatherBox = GetIt.instance<WeatherBox>();
        weatherBox.delete();
        Navigator.pop(context);
      },
      icon: Icon(Icons.close),
    );
  }

  Widget _weatherForm() {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      print(state.formStatus);
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: state.weatherData.length,
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
                          Text(state.weatherData[index].day,
                              style: TextStyle(fontSize: 25)),
                          SizedBox(
                            width: 20,
                          ),
                          Text('${state.weatherData[index].temp}°C',
                              style: TextStyle(fontSize: 25)),
                          SizedBox(
                            width: 20,
                          ),
                          Text(state.weatherData[index].weatherIcon,
                              style: TextStyle(fontSize: 25)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.weatherData[index].weatherMessage,
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
    });
  }
}
