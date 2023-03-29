import 'package:flutter/material.dart';
import 'package:soulfit/meditation/breathing_exercise.dart';

class SecondPart extends StatelessWidget {
  const SecondPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              width: 50,
              child: Divider(
                color: Color.fromRGBO(97, 159, 210, 1),
                thickness: 8,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How's your mood today?",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(15, 111, 189, 0.2),
                  ),
                  height: 70,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/images/sad 1.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(15, 111, 189, 0.4),
                  ),
                  height: 70,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/images/unhappy 1.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(15, 111, 189, 0.6),
                  ),
                  height: 70,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/images/neutral 1.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(15, 111, 189, 0.8),
                  ),
                  height: 70,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/images/happiness 1.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromRGBO(15, 111, 189, 1),
                  ),
                  height: 70,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/images/happy 1.png",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(66, 102, 192, 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Breathing \nExercise",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          "Relax and centre \nyour focus",
                          style: TextStyle(fontSize: 15, color: Colors.white60),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => BreathingExercise())));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.75),
                        radius: 50,
                        child: const Text(
                          "Start",
                          style: TextStyle(
                              color: Color.fromRGBO(2, 35, 84, 1),
                              letterSpacing: 2,
                              fontSize: 23),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
