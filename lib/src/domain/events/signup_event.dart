abstract class SignupEvent {}

class SignupUsernameChanged extends SignupEvent {
  final String? username;
  SignupUsernameChanged({this.username});
}

class SignupPasswordChanged extends SignupEvent {
  final String? password;
  SignupPasswordChanged({this.password});
}

class SignupConfirmPasswordChanged extends SignupEvent {
  final String? confirmPassword;
  SignupConfirmPasswordChanged({this.confirmPassword});
}

class SignupSubmitted extends SignupEvent {}

class SignupReset extends SignupEvent {}
