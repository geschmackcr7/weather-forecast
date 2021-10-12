import 'package:weather_forecast/src/domain/repositories/auth_repository.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/domain/events/signup_event.dart';
import 'package:weather_forecast/src/domain/entities/signup_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepo;

  SignupBloc({required this.authRepo}) : super(SignupState());

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

    // Form submitted
    if (event is SignupSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.signup(
            state.username, state.password, state.confirmPassword);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(
            formStatus: SubmissionFailed(Exception('Invalid')));
      }
    }
  }
}
