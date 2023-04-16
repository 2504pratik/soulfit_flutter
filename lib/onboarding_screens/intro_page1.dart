import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xFF1A4C5B),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        child: (const Image(
                          image: AssetImage('assets/images/Ellipse 100.png'),
                        )),
                      ),
                      const Positioned(
                          top: 50,
                          right: 100,
                          child: Text('Welcome!',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xFF1A4C5B),
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                  const SizedBox(height: 80),
                  const Text(
                    'Start Your Journey to make a better you with SoulFit',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'First, let\'s get to know you',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),

                  Container(
                    height: 54,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Enter your name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffDBE2E8),
                    ),
                  ),
                ],
              ),
            )));
  }
}
