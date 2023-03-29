import 'package:flutter/material.dart';

import '../meditation/meditation.dart';

class MeditationTab extends StatelessWidget {
  const MeditationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const Meditation()))),
      child: SizedBox(
        height: 150,
        width: 400,
        child: Stack(children: [
          Container(
            height: 150,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(97, 159, 210, 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            right: 70,
            child: SizedBox(
              width: 200,
              height: 80,
              child: Image.asset(
                "assets/images/Vector 8.png",
                fit: BoxFit.fill,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: SizedBox(
              width: 100,
              height: 50,
              child: Image.asset(
                "assets/images/Vector 8.png",
                fit: BoxFit.fill,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          Positioned(
            height: 150,
            right: 18,
            child: Image.asset(
              "assets/images/Image14.png",
              height: 95,
              width: 95,
            ),
          ),
          const Positioned(
            top: 60,
            left: 30,
            child: Text(
              'Meditation',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
