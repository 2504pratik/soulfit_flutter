import 'package:flutter/material.dart';

import 'package:soulfit/physical_fitness.dart';
import 'package:soulfit/profile_page.dart';

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

  Widget buildCard(
      String title, Color color, String desc, BuildContext context) {
    return InkWell(
      onTap: () => navigate(context),
      splashColor: color,
      borderRadius: BorderRadius.circular(35),
      child: Card(
        color: Colors.transparent,
        elevation: 15,
        child: Container(
          height: 150,
          width: 400,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(35)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  desc,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
            padding: const EdgeInsets.only(bottom: 150, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Good Morning!',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      IconButton(
                        icon: const Icon(Icons.account_circle_rounded),
                        iconSize: 35,
                        color: Colors.white70,
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
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          buildCard('Physical Fitness', const Color.fromRGBO(204, 96, 112, 1),
              '“The body achieves what the mind believes.”', context),
          const SizedBox(
            height: 30,
          ),
          buildCard(
              'Mental Fitness',
              const Color.fromRGBO(97, 159, 210, 1),
              '"Exercise keeps you occupied, which is good for your mental health."',
              context),
          const SizedBox(
            height: 30,
          ),
          buildCard(
              'Meditation',
              const Color.fromRGBO(107, 186, 142, 1),
              '"Deep breathing is our nervous system’s love language." ',
              context)
        ],
      ),
    );
  }
}
