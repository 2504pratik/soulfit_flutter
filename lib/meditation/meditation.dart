import 'package:flutter/material.dart';

import 'package:soulfit/meditation/initial_part.dart';
import 'package:soulfit/meditation/second_part.dart';
import 'package:soulfit/meditation/third_part.dart';

class Meditation extends StatelessWidget {
  const Meditation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(97, 159, 210, 1),
        body: SingleChildScrollView(
          child: Column(
            children: const [InitialPart(), SecondPart(), ThirdPart()],
          ),
        ));
  }
}
