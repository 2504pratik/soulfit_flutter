import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soulfit/login_page/login_page.dart';

import '../models/dbHelper.dart';

class LastPart extends StatelessWidget {
  LastPart({Key? key}) : super(key: key);
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(67, 129, 133, 0.5),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'My Rewards:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(44, 105, 117, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Daily Streak:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(44, 105, 117, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(28, 85, 97, 1)),
                  elevation: MaterialStateProperty.all(10),
                  fixedSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50))),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                await googleSignIn.signOut();
                await SQLHelper.deleteDatabaseFile();

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LogIn()),
                  (route) => false,
                );
              },
              child: const Center(
                  child: Text(
                'Log Out',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            )
          ],
        ),
      ),
    );
  }
}
