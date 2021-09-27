import 'package:flutter/material.dart';
import 'package:weather_forecast/screens/login_screen.dart';
import 'package:weather_forecast/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },
            color: Colors.lightBlueAccent,
            child: Text(
              'Login',
            ),
          ),

          SizedBox(
            height: 30.0,
          ),

          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
            color: Colors.lightBlueAccent,
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
