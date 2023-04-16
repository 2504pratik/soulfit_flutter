import 'package:flutter/material.dart';
import 'package:soulfit/onboarding_screens/intro_page2.dart';

import '../models/dbHelper.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  _IntroPage1State createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => IntroPage2(name: name),
          ));
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(26, 76, 91, 1)),
        ),
        child: Image.asset('assets/images/next_btn.png'),
      ),
      backgroundColor: const Color(0xFF1A4C5B),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 130),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/Ellipse 100.png'),
                  const Positioned(
                    top: 50,
                    left: 40,
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                          color: Color.fromRGBO(25, 63, 69, 1),
                          fontSize: 50,
                          letterSpacing: 3),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'Start Your Journey to \nmake a better you \nwith SoulFit!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  wordSpacing: 4,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 50),
              const Text(
                'First, let\'s get to \nknow you',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  wordSpacing: 4,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSubmitted: (value) async {
                  setState(() {
                    name = value;
                  });
                  await SQLHelper.createUser(
                      name, null, null, null, null, null);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
