import 'package:flutter/material.dart';

import 'package:soulfit/profile_page/first_part.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(159, 191, 193, 1),
      body: Column(
        children: const [FirstPart()],
      ),
    );
  }
}
