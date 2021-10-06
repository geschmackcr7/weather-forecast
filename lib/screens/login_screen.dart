import 'package:flutter/material.dart';
import 'package:weather_forecast/screens/signup_screen.dart';
import 'package:weather_forecast/screens/weather_forecast_screen.dart';
import 'package:weather_forecast/constants.dart';
import '../components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather forecast'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  colour: Colors.lightBlueAccent,
                  title: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, '/weatherForecast');
                  },
                ),
                SizedBox(
                  width: 50.0,
                ),
                RoundedButton(
                  colour: Colors.lightBlueAccent,
                  title: 'Sign up',
                  onPressed: () {
                    Navigator.pushNamed(context, '/signUp');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
