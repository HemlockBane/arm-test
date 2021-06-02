import 'package:arm_test/src/screens/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = 'sign_in';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  'Login',
                  style: TextStyle(fontSize: 30),
                ),
                vertSpace(height: 100),
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
                  child: Text('Login'),
                ),
                vertSpace(height: 5),
                TextButton(
                  child: Text("Sign Up"),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(SignUpScreen.routeName);
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
