import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const HomePage())));
                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(77, 189, 139, 1))),
                    child: Image.asset("assets/images/MentalFit_backBtn.png"),
                  ),
                  Image.asset("assets/images/image 32.png"),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(0, 82, 34, 1))),
                      onPressed: (() {}),
                      child: Row(
                        children: const [
                          Text(
                            '0',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 253, 211, 1),
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
        const Positioned(
          top: 140,
          right: 100,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Color.fromRGBO(10, 118, 70, 1),
          ),
        ),
        const Positioned(
          top: 160,
          right: -30,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Color.fromRGBO(10, 118, 70, 1),
          ),
        ),
        const Positioned(
          top: 280,
          left: 10,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Color.fromRGBO(10, 118, 70, 1),
          ),
        ),
        Positioned(
          top: 200,
          left: 30,
          right: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 110,
              width: 350,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 24)
                  ],
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(255, 255, 255, 0.85),
                    Color.fromRGBO(255, 255, 255, 0.45)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: const Center(
                child: Text(
                  '"Mental health…is not a destination, but a process. It’s about how you drive, not where you’re going.” \n~ Noam Shpancer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(4, 35, 83, 1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
