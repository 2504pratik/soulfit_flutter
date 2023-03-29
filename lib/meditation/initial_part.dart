import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class InitialPart extends StatelessWidget {
  const InitialPart({Key? key}) : super(key: key);

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
                            const Color.fromRGBO(97, 159, 210, 1))),
                    child: Image.asset("assets/images/back_med.png"),
                  ),
                  Image.asset("assets/images/med.png"),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(30, 61, 138, 1))),
                      onPressed: (() {}),
                      child: Row(
                        children: const [
                          Text(
                            '25',
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
        Positioned(
          top: 180,
          left: -20,
          child: SizedBox(
            width: 200,
            height: 80,
            child: Image.asset(
              "assets/images/Vector 8.png",
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: -20,
          child: SizedBox(
            width: 100,
            height: 30,
            child: Image.asset(
              "assets/images/Vector 8.png",
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 215,
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
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(255, 255, 255, 0.4)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: const Center(
                child: Text(
                  '"Remember the blue sky. It may at times be obscured by clouds, but it is always there.” \n~ Andy Puddicombe',
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
