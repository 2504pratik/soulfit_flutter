import 'package:flutter/material.dart';

import '../physical_fitness/physical_fitness.dart';

class PhysicalTab extends StatelessWidget {
  const PhysicalTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: ((context) => PhysicalFitness()))),
      child: SizedBox(
        height: 150,
        width: 400,
        child: Stack(children: [
          Container(
            height: 150,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(204, 89, 112, 1),
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
            right: 0,
            top: 52,
            child: Image.asset(
              "assets/images/Vector 3.png",
            ),
          ),
          Positioned(
            right: 15,
            top: 30,
            child: Image.asset(
              "assets/images/Image7.png",
              height: 100,
              width: 100,
            ),
          ),
          const Positioned(
            top: 60,
            left: 30,
            child: Text(
              'Physical Fitness',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
