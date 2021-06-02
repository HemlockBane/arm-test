import 'package:arm_test/src/screens/login.dart';
import 'package:arm_test/src/services/firestore_service.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static final String routeName = 'sign_up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

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
                  controller: fNameController,
                  decoration: InputDecoration(labelText: 'Firstname'),
                ),
                vertSpace(height: 20),
                TextFormField(
                  controller: lNameController,
                  decoration: InputDecoration(labelText: 'Lastname'),
                ),
                vertSpace(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                vertSpace(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                vertSpace(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final data = <String, String>{
                      "firstname": fNameController.text,
                      "lastname": lNameController.text,
                      "email": emailController.text,
                      "password": passwordController.text
                    };
                    try {
                      await FirestoreDB.register(data: data);
                      Navigator.of(context)
                          .popAndPushNamed(LoginScreen.routeName);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Sign Up'),
                ),
                vertSpace(height: 5),
                TextButton(
                  child: Text("Login"),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(LoginScreen.routeName);
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
