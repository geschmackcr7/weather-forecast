import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            onChanged: (value){},
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.0,),
          TextField(
            onChanged: (value) {},
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.0,),
          MaterialButton(
            onPressed: () {},
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
