import 'package:flutter/material.dart';
import 'package:soulfit/profile_page/extra_part.dart';

import 'package:soulfit/profile_page/first_part.dart';
import 'package:soulfit/profile_page/info_container.dart';
import 'package:soulfit/profile_page/last_part.dart';
import 'package:soulfit/profile_page/mid_part.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    FirstPart(),
                    const MidPart(),
                    LastPart(),
                    const ExtraPart(),
                  ],
                ),
                const Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  child: InfoContainer(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
