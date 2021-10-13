//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/src/domain/repositories/auth_repository.dart';
import 'package:weather_forecast/src/domain/events/form_submittion_status.dart';
import 'package:weather_forecast/src/presentation/blocs/login_bloc.dart';
import 'package:weather_forecast/src/domain/events/login_event.dart';
import 'package:weather_forecast/src/domain/entities/login_entity.dart';
import 'package:weather_forecast/src/core/constants/constants.dart';
import '../widgets/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather forecast'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: AuthRepository(),
        ),
        child: _loginForm(context),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showToast(context, formStatus.exception.toString());
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
                  height: 30.0,
                ),
                _passwordField(),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _loginButton(),
                      SizedBox(
                        width: 20.0,
                      ),
                      _signupButton(context),
                    ])
              ]),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        textAlign: TextAlign.center,
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginUsernameChanged(username: value)),
        validator: (value) =>
            state.isValidUsername ? null : 'Username is too short',
        decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        textAlign: TextAlign.center,
        obscureText: true,
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginPasswordChanged(password: value)),
        validator: (value) =>
            state.isValidPassword ? null : 'Password is too short',
        decoration:
            kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
      );
    });
  }

  Widget _loginButton() {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.formStatus is SubmissionSuccess) {
        Navigator.pushNamed(context, '/weatherForecast');
      }
    }, builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Login',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                  print(state.formStatus);
                }
              },
            );
    });
  }

  Widget _signupButton(BuildContext context) {
    return RoundedButton(
      colour: Colors.lightBlueAccent,
      title: 'Sign up',
      onPressed: () {
        Navigator.pushNamed(context, '/signUp');
      },
    );
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
