import 'package:arm_test/src/screens/home.dart';
import 'package:arm_test/src/screens/login.dart';
import 'package:arm_test/src/screens/sign_up.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
      },
    );
  }
}
