import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:googleapis_auth/auth_io.dart';

import 'package:flutter/material.dart';

import 'home_page/home_page.dart';
import 'login_page/login_page.dart';

final _credentials = ServiceAccountCredentials.fromJson({
  "private_key":
      "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCLb0Dba1GJ21cK\nTIQJi5lqwE7bcztgymH+fHqrrrIqpp329fvN7F8tZQbX8zQOFtgRltxQMCvMVkVj\nRZgKfMR90N+NX9dMSoMqfFnAsKH8hmhv4Ev2QTq4qXD2ODbCZDUU/sGP0VKshlnm\neGdSwJcm940sQvTE+rxCZD+b19G9wx0lB5ZZE/RTWcj5nsGhfPrt5Stw/ypTsenT\naAJG7DsSNDLOr6PRCTx7Fy4UXmf89G2GpKANYUnaCb7Q56CZ2CJwb06Hv4LQjreW\nZi6rIeICWRInpNwWe3eceu2vdrnnomvCbyyyIp2QxBai3fB/tXQDVkPeZYVM0SQZ\nEIkJcGa9AgMBAAECggEAPYP4T7WhtBnOZU9Lo3Bw3313bO8CP9oZ8K4Xar34gcOf\nhnCQxpFljj/3jHeSPDMM4Xm2ujP+ZribBUiTYvEXuVBZCGTDtjdbdfeFm3LyDFh6\nI/2HVd4CW6z5ls9HLW0LVDduyxX1DQN7DyiIoSQxq3Hk2SWzGmJqgzn6LDXDpZ2T\n/Ugw3bPQOyWSMPs/IJCzr19qj5RGA7vIAn3U/0Z0EMoUwHqxILp1PT0cn7v8Bc9G\nNXGbEeY6i5rVM2nbLNRfnUBkmqkSNqzykdigGO3NGfso6xIBzCNbBzyyAw1NH8hq\ncF5iz/GuQdu+JSz61x1+DH9Qx67l4SiVHyeQFfhUCwKBgQC9Z3N4hbHSfV64f3PI\nWLXM5EL0ErkFMRKo3y8CoZdX0J1bnOHSbx8xlYUqvqGUStChvvkUVomNz6Vn7o5w\nSyJS5oZ7TrW+GmJftUcqZ7/4CCNnPlqiPWG/eUKWpcJK21hsiBQA4nkAUJlV31bT\nCrXub20tDUnab69ZqvDBEs/ZqwKBgQC8dfhlQr0KiXP1UAzKHueTCxkc3SYXv3jw\nubwL9NPfhahOA775JX+MB9Gl3VlPZ9xsfcfdefXCSL0KWjxELtuGWJaWBgUXFkXn\nEEe9uRM6bl8qzQCJC7aFprn7f6nws2PhMnW9iUKUGqg0iPCWkMiQRyXGwSx557Z9\nudVBQQTpNwKBgD+2szNR1hW2ssxho3M71DxOdO9h9Pd4IIzKNygtb5nMxYJx7c06\nMEYfxCIy6mvWFwSyF1vuGGup9DxYFXZU8ADvJ0IHoj+G5JzJgF0VdZBcPHyYjyiQ\neXdNtUa0D/3ad45a4E/D32xpsIsgjDaGHdlNhm5nT/a5J0WEqWRpjZ3tAoGBAJJ/\nIZeVSV3nezw1/bsgSuMCvYKyZeoP7PMzbfndVtVqEGqUft8tRviTG2TTq5kOI0oy\nfCqto1xjLo/dlPtrcTn9oxD7nPlVVwFGpn3UYB4Lre6XbNMbR8ac0/WsR23UBNAJ\naXzsNdTq49XynRJteXqt06+seeZJOJKC4kLXR/oBAoGAPyloy1hdFGpXoM+BoQYu\nus82LxjYlYVRyBlbKb/weEynNd9g9MXN0z5MOAkFCqIefEpHohYSx0eAdPU9s3aK\nsBcOqwYuYn7aeojb6ivWPjWQE/ZuRaqvIcLhtqLpN66BejZhUa1jalrIM0dr02CX\nTAeYQB+3ZEOQQt/9MMaKyUE=\n-----END PRIVATE KEY-----\n",
  "client_email": "soulfit@soulfit-d3dd5.iam.gserviceaccount.com",
  "client_id": "108596919965413666005",
  "type": "service_account"
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await clientViaServiceAccount(_credentials, [
    "https://www.googleapis.com/auth/fitness.activity.read",
    "https://www.googleapis.com/auth/fitness.activity.write",
    "https://www.googleapis.com/auth/fitness.body.read",
    "https://www.googleapis.com/auth/fitness.body.write"
  ]).then((client) async {
    // Use the authorized client to access Google Fit API.
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoulFit',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return const LogIn();
            } else {
              return const HomePage();
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(233, 234, 236, 1),
      ),
    );
  }
}
