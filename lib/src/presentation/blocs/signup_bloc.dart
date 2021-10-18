import 'package:get_it/get_it.dart';
import 'package:weather_forecast/src/domain/repositories/auth_repository.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/domain/events/signup_event.dart';
import 'package:weather_forecast/src/domain/entities/signup_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    // username update
    if (event is SignupUsernameChanged) {
      yield state.copyWith(username: event.username);
    }

    // password update
    if (event is SignupPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    // confirm password update
    if (event is SignupConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);
    }

    if (event is SignupReset) {
      yield state.copyWith(formStatus: InitialFormStatus());
    }
    // Form submitted
    if (event is SignupSubmitted) {
      if (state.password != state.confirmPassword) {
        yield state.copyWith(
            formStatus: SubmissionFailed(
                Exception('Password confirm is not same as password')));
      }

      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await GetIt.instance<AuthRepository>()
            .signup(state.username, state.password, state.confirmPassword);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(
            formStatus: SubmissionFailed(Exception('Invalid')));
      }
    }
  }
}
