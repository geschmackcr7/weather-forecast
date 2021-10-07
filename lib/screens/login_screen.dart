import 'package:flutter/material.dart';
import 'package:weather_forecast/constants.dart';
import '../components/rounded_button.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  Future<dynamic> userLogin() async {
    String url =
        dotenv.get('API_AUTH_HOST') + dotenv.get('API_AUTH_SIGNIN_PATH');
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'X-Consumer-Username': 'acc.user.1593502251879746903',
          'x-sha1-fingerprint': dotenv.get('API_KEY'),
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        String data = response.body;
        print(data);
        return jsonDecode(data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

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
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
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
                  onPressed: () async {
                    print(email);
                    print(password);
                    try {
                      var data = await userLogin();
                      print(data);
                      if (data == null) {
                        _showToast(context, 'Invalid !!!');
                      } else {
                        Navigator.pushNamed(context, '/loadingScreen');
                      }
                    } catch (e) {
                      _showToast(context, 'System Error !!!');
                    }
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
