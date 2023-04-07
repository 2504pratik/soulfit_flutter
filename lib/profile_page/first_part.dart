import 'package:flutter/material.dart';

import 'package:soulfit/models/profile.dart';
import 'package:soulfit/profile_page/edit_info.dart';

import '../home_page/home_page.dart';

// ignore: must_be_immutable
class FirstPart extends StatelessWidget {
  FirstPart({Key? key}) : super(key: key);
  final Profile _profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(159, 191, 193, 1),
      height: 500,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
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
                          const Color.fromRGBO(159, 191, 193, 1))),
                  child: Image.asset("assets/images/Vector.png"),
                ),
                const Text(
                  "My Profile",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                const EditInfo()
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CircleAvatar(
            backgroundColor: Colors.white60,
            radius: 70,
            child: Icon(
              Icons.person,
              size: 70,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'My Name',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
