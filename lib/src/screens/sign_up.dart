import 'package:arm_test/src/screens/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static final String routeName = 'sign_up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                vertSpace(height: 100),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30),
                ),
                vertSpace(height: 100),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Firstname'),
                ),
                vertSpace(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Lastname'),
                ),
                vertSpace(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                vertSpace(height: 20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                vertSpace(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign Up'),
                ),
                vertSpace(height: 5),
                TextButton(
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget vertSpace({double height = 10}) {
    return SizedBox(
      height: height,
    );
  }
}
