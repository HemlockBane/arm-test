import 'package:arm_test/src/screens/home.dart';
import 'package:arm_test/src/screens/sign_up.dart';
import 'package:arm_test/src/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = 'sign_in';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  Future<FirebaseApp> initialiseFirebase() async {
    final firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialiseFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return showLoginForm(context);
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.blue,
            ),
          ),
        );
      },
    );
  }

  Widget showLoginForm(BuildContext context) {
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
                  child: Text('Login'),
                  onPressed: () async {
                    var email = emailController.text;
                    var password = passwordController.text;

                    final user = await FirestoreDB.login(email, password);

                    if (user.isValid) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomeScreen(user: user);
                      }));
                    }
                  },
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
