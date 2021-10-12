import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';

class SignupState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final String confirmPassword;
  bool get isValidConfirmPassword => confirmPassword.length > 6;

  final FormSubmissionStatus formStatus;

  SignupState({
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignupState copyWith({
    String? username,
    String? password,
    String? confirmPassword,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
