import 'package:flutter/material.dart';
import 'package:task3/screens/RegisterScreen.dart';
import 'package:task3/screens/PaymentScreen.dart';
import 'package:task3/screens/loginRegister.dart';
import 'package:task3/screens/loginScreen.dart';
import 'package:task3/screens/address.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'first',
      routes: {
        'first': (context) => loginRegister(),
        'second': (context) => RegisterScreen(),
        'third': (context) => loginScreen(),
        'fourth': (context) => paymentScreen(),
        'fifth': (context) => Address(),
      },
    );
  }
}
