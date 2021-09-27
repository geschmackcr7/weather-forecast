import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            textAlign: TextAlign.center,
            onChanged: (value) {},
          ),
          SizedBox(height: 30.0,),
          TextField(
            textAlign: TextAlign.center,
            onChanged: (value){},
          ),
          SizedBox(height: 30.0,),
          MaterialButton(
            onPressed: (){},
            color: Colors.lightBlueAccent,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
