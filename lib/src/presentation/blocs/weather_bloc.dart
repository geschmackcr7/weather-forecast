import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/domain/events/weather_event.dart';
import 'package:weather_forecast/src/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/domain/repositories/weather_box.dart';
import 'package:weather_forecast/src/domain/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState());
  //WeatherBloc() : super(GetIt.instance<WeatherState>());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherGetted) {
      yield state.copyWith(formStatus: FormSubmitting());
      WeatherBox weatherBox = GetIt.instance<WeatherBox>();
      if (weatherBox.get().formStatus == SubmissionSuccess()) {
        yield state.copyWith(
          formStatus: SubmissionSuccess(),
          weatherData: weatherBox.get().weatherData,
        );
      } else
        try {
          var respone =
              await GetIt.instance<WeatherRepository>().getWeatherData();
          List<Weather> data = GenData().geneList(respone);
          yield state.copyWith(
            formStatus: SubmissionSuccess(),
            weatherData: data,
          );
          weatherBox.add(state);
        } catch (e) {
          yield state.copyWith(
              formStatus: SubmissionFailed(Exception('Invalid')));
        }
    }
  }
}
