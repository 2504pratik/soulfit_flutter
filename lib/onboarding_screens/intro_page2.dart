import 'package:flutter/material.dart';
import 'package:soulfit/onboarding_screens/intro_page3.dart';

import '../models/dbHelper.dart';

class IntroPage2 extends StatefulWidget {
  String name;
  IntroPage2({required this.name, super.key});

  @override
  State<IntroPage2> createState() => _MyAppState();
}

class _MyAppState extends State<IntroPage2> {
  // ignore: non_constant_identifier_names
  Widget stud_container() {
    return GestureDetector(
      onTap: () async {
        await SQLHelper.updateProfession('Student', widget.name);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 200,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Student",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500)),
            Image.asset('assets/images/std.png'),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget emp_container() {
    return GestureDetector(
      onTap: () async {
        await SQLHelper.updateProfession('Employee', widget.name);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 200,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Employee",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500)),
            Image.asset('assets/images/emp.png'),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget prof_container() {
    return GestureDetector(
      onTap: () async {
        await SQLHelper.updateProfession('Professor', widget.name);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 200,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Teacher",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500)),
            Image.asset('assets/images/prof.png'),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget retired_container() {
    return GestureDetector(
      onTap: () async {
        await SQLHelper.updateProfession('Retired', widget.name);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        height: 200,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Retired",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500)),
            Image.asset('assets/images/retired.png'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => IntroPage3(
              name: widget.name,
            ),
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
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  stud_container(),
                  emp_container(),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  prof_container(),
                  retired_container(),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Other:",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
