import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soulfit/login_page/auth_services.dart';

import '../onboarding_screens/intro_page1.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late GoogleSignIn _googleSignIn;
  late FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(scopes: ['email']);
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1C5560),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 220, child: Image.asset('assets/images/logo.png')),
              ElevatedButton(
                onPressed: () async {
                  final User? user = await AuthService().signInWithGoogle();
                  if (user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntroPage1()),
                    );
                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(250, 50)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Set the border radius to 10
                    side: const BorderSide(
                        color: Colors.white), // Set the border color to white
                  )),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  'Sign in with Google',
                  style: TextStyle(
                      fontSize: 20, color: Colors.black, letterSpacing: 2),
                ),
              ),
            ],
          ),
        ));
  }
}
