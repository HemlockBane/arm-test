import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                Text('Sign In', style: TextStyle(fontSize: 30),),
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
                  child: Text('Sign In'),
                ),
                vertSpace(height: 5),
                TextButton(
                  child: Text("Sign Up"),
                  onPressed: () {},
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
