import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/src/domain/entities/login_entity.dart';
import 'package:weather_forecast/src/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/domain/events/weather_event.dart';
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
    // TODO: implement initState
    context.read<WeatherBloc>().add(WeatherGetted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: SizedBox(width: 20),
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
        body: _weatherForm(),
      );
    });
  }

  Widget _weatherForm() {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      print('hello');
      print(state.weatherData);
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
