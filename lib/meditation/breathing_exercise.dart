import 'package:flutter/material.dart';
import 'package:soulfit/meditation/breathing_circle.dart';
import 'package:soulfit/meditation/meditation.dart';

class BreathingExercise extends StatelessWidget {
  const BreathingExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(66, 102, 192, 1),
      body: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(66, 102, 192, 1)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(MaterialPageRoute(
                        builder: (context) => const Meditation(),
                      ));
                    },
                    child: Image.asset('assets/images/back_btn.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Breathing Exercise',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const BreathingCircle(),
            const SizedBox(
              height: 30,
            ),
            Text(
              '"Relax and centre your focus!"',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "You're doing great!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ],
        ),
        const Positioned(
          top: 120,
          right: 50,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromRGBO(80, 190, 225, 1),
          ),
        ),
        const Positioned(
          bottom: 110,
          left: 20,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Color.fromRGBO(80, 190, 225, 1),
          ),
        ),
        const Positioned(
          top: 180,
          left: 20,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color.fromRGBO(80, 190, 225, 1),
          ),
        ),
        const Positioned(
          top: 460,
          right: 60,
          child: CircleAvatar(
            radius: 7,
            backgroundColor: Colors.white,
          ),
        )
      ]),
    );
  }
}
