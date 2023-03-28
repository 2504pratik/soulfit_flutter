import 'package:flutter/material.dart';

import 'physical_fitness.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void navigate(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const PhysicalFitness())));
  }

  void openProfile(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const UserProfile())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(44, 105, 117, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(1000),
              bottomRight: Radius.circular(2000)),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Container(
            padding: const EdgeInsets.only(bottom: 100, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Good \nMorning!',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      IconButton(
                        icon: const Icon(Icons.account_circle_rounded),
                        iconSize: 45,
                        color: Colors.white,
                        onPressed: (() => openProfile(context)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 15,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Card(
              elevation: 8,
              color: Colors.transparent,
              child: InkWell(
                onTap: () => navigate(context),
                child: SizedBox(
                  height: 150,
                  width: 400,
                  child: Stack(children: [
                    Container(
                      height: 150,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromRGBO(204, 89, 112, 1)),
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
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              color: Colors.transparent,
              elevation: 8,
              child: InkWell(
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
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
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
            )
          ],
        ),
      ),
    );
  }
}
