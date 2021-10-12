import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/domain/events/weather_event.dart';
import 'package:weather_forecast/src/domain/entities/weather_entity.dart';
import 'package:weather_forecast/src/domain/repositories/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepo;
  WeatherBloc({required this.weatherRepo}) : super(WeatherState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherGetted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        var respone = await weatherRepo.getWeatherData();
        yield state.copyWith(
          formStatus: SubmissionSuccess(),
          respone: respone,
        );
      } catch (e) {
        yield state.copyWith(
            formStatus: SubmissionFailed(Exception('Invalid')));
      }
    }
  }
}
