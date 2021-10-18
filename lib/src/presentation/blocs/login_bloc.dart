import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast/src/domain/repositories/auth_repository.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/domain/events/login_event.dart';
import 'package:weather_forecast/src/domain/entities/login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // username update
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    }

    // password update
    if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    if (event is Logout) {
      yield state.copyWith(formStatus: InitialFormStatus());
    }

    // Form submitted
    if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        var response = await GetIt.instance<AuthRepository>()
            .login(state.username, state.password);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response.token);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(
            formStatus: SubmissionFailed(Exception('Invalid')));
      }
    }
  }
}
