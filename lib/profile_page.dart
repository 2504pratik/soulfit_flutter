import 'package:flutter/material.dart';
import 'package:soulfit/home_page.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  void backToHome(BuildContext context) {
    Navigator.pop(
        context, MaterialPageRoute(builder: ((context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        backgroundColor: const Color.fromRGBO(44, 105, 117, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(2000),
              bottomRight: Radius.circular(2000)),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Container(
            padding: const EdgeInsets.only(top: 30),
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white60,
              foregroundColor: Colors.black54,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),
          ),
        ),
        elevation: 15,
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
