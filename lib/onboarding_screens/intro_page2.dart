// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(const intro_page2());

class intro_page2 extends StatefulWidget {
  const intro_page2({super.key});

  @override
  State<intro_page2> createState() => _MyAppState();
}

class _MyAppState extends State<intro_page2> {
  // ignore: non_constant_identifier_names
  Widget stud_container() {
    return MouseRegion(
  onEnter: (_) {
    // handle hover enter event here
  },
  onExit: (_) {
    // handle hover exit event here
  },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 150,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Student",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Image.asset('assets/images/std.png'),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget emp_container() {
    return GestureDetector(
      onDoubleTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 150,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Employee",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Image.asset('assets/images/emp.png'),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget prof_container() {
    return GestureDetector(
      onDoubleTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 150,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Teacher",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Image.asset('assets/images/prof.png'),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget retired_container() {
    return GestureDetector(
      onDoubleTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 150,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Retired",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            Image.asset('assets/images/retired.png'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFF1A4C5B),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Column(
                children:[
                  Container(
                    height: 70.0,
                    width: double.infinity, //diff views in different devices
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Center(
                      child: Text(
                        "Select Your Profession",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            wordSpacing: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          stud_container(),
                          emp_container(),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          prof_container(),
                          retired_container(),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              "Other:"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 60.0,
                        width:
                            double.infinity, //diff views in different devices
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ),
            ),
      );
  }
}
