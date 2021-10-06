import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/rounded_button.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = '';
  String password = '';
  String confirmPassword = '';

  Future<dynamic> createUser() async {
    String url =
        dotenv.get('API_AUTH_HOST') + dotenv.get('API_AUTH_SIGNUP_PATH');
    //print(url);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Access-Control-Allow-Headers': 'Access-Control-Allow-Origin, Accept',
          'x-sha1-fingerprint': dotenv.get('API_KEY'),
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
    } catch (e) {
      print(e);
    }
    //print(response.statusCode);
    return null;
    // if (response.statusCode == 200) {
    //   String data = response.body;
    //   return jsonDecode(data);
    // } else {
    //   return null;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                email = value;
              },
              textAlign: TextAlign.center,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              onChanged: (value) {
                confirmPassword = value;
              },
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Confirm your password'),
            ),
            SizedBox(
              height: 30.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Sign up',
              onPressed: () async {
                print(email);
                print(password);
                print(confirmPassword);
                if (password != confirmPassword) {
                  print('Confirm password is invalid');
                  return;
                }
                try {
                  var data = await createUser();
                  print(data);
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
