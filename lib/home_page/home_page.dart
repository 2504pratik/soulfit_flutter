import 'package:flutter/material.dart';

import '../profile_page/profile_page.dart';
import 'meditation_tab.dart';
import 'mental_tab.dart';
import 'physical_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                        'Good \nEvening!',
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
                        onPressed: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const UserProfile())))),
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
          children: const [
            SizedBox(
              height: 20,
            ),
            PhysicalTab(),
            SizedBox(
              height: 30,
            ),
            MeditationTab(),
            SizedBox(
              height: 30,
            ),
            MentalTab()
          ],
        ),
      ),
    );
  }
}
