import 'package:weather_forecast/src/domain/repositories/auth_repository.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/domain/events/login_event.dart';
import 'package:weather_forecast/src/domain/entities/login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

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

    // Form submitted
    if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login(state.username, state.password);
        yield state.copyWith(formStatus: SubmissionSuccess());
        print(state.formStatus);
      } catch (e) {
        yield state.copyWith(
            formStatus: SubmissionFailed(Exception('Invalid')));
      }
    }
  }
}
