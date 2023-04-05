import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soulfit/login_page/auth_services.dart';

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
      body: Center(
        child: ElevatedButton(
          onPressed: () => AuthService().signInWithGoogle(),
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
