import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/src/domain/repositories/auth_repository.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/presentation/blocs/signup_bloc.dart';
import 'package:weather_forecast/src/domain/events/signup_event.dart';
import 'package:weather_forecast/src/domain/entities/signup_entity.dart';
import 'package:weather_forecast/src/core/constants/constants.dart';
import '../widgets/rounded_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather forecast'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: _signupForm(),
    );
  }

  Widget _signupForm() {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          context.read<SignupBloc>().add(SignupReset());
          _showToast(context, formStatus.exception.toString());
        }
        if (formStatus is SubmissionSuccess) {
          context.read<SignupBloc>().add(SignupReset());
          Navigator.pop(context);
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _usernameField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _passwordField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _confirmPasswordField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _signupButton(),
                ])),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        textAlign: TextAlign.center,
        onChanged: (value) => context
            .read<SignupBloc>()
            .add(SignupUsernameChanged(username: value)),
        validator: (value) =>
            state.isValidUsername ? null : 'Username is too short',
        decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        textAlign: TextAlign.center,
        obscureText: true,
        onChanged: (value) => context
            .read<SignupBloc>()
            .add(SignupPasswordChanged(password: value)),
        validator: (value) =>
            state.isValidPassword ? null : 'Password is too short',
        decoration:
            kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
      );
    });
  }

  Widget _confirmPasswordField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        textAlign: TextAlign.center,
        obscureText: true,
        onChanged: (value) => context
            .read<SignupBloc>()
            .add(SignupConfirmPasswordChanged(confirmPassword: value)),
        validator: (value) => state.isValidConfirmPassword
            ? null
            : 'Confirm password is too short',
        decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your confirm password'),
      );
    });
  }

  Widget _signupButton() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Signup',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SignupBloc>().add(SignupSubmitted());
                }
              },
            );
    });
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
