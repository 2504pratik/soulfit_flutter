import 'package:flutter/material.dart';
import 'package:soulfit/mental_fitness/mental_fitness.dart';

class MentalTab extends StatelessWidget {
  const MentalTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const MentalFitness()))),
      child: SizedBox(
        height: 150,
        width: 400,
        child: Stack(children: [
          Container(
            height: 150,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(77, 189, 139, 1),
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
            top: 80,
            right: 100,
            child: SizedBox(
              height: 100,
              width: 170,
              child: Image.asset(
                "assets/images/Vector 2.png",
                height: 100,
                width: 170,
              ),
            ),
          ),
          const Positioned(
            top: 25,
            left: 15,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Color.fromRGBO(32, 157, 101, 1),
            ),
          ),
          const Positioned(
            top: 15,
            left: 70,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromRGBO(32, 157, 101, 1),
            ),
          ),
          const Positioned(
            top: 80,
            right: 125,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromRGBO(32, 157, 101, 1),
            ),
          ),
          const Positioned(
            top: 110,
            left: 140,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Color.fromRGBO(32, 157, 101, 1),
            ),
          ),
          Positioned(
            height: 150,
            right: 18,
            child: Image.asset(
              "assets/images/Image12.png",
              height: 95,
              width: 95,
            ),
          ),
          const Positioned(
            top: 60,
            left: 30,
            child: Text(
              'Mental Fitness',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
