import 'package:flutter/material.dart';
import 'package:soulfit/home_page.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_circle_left_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: (() => Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const HomePage()))),
            ),
            title: const Text(
              'My Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.edit_note_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              )
            ],
            backgroundColor: Colors.green.shade100,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(320),
              child: Container(
                height: 300,
                decoration: BoxDecoration(color: Colors.green.shade100),
                child: Column(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 80,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'My Name',
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )),
        body: const Card(
          color: Colors.black,
          child: Icon(Icons.abc),
        ),
      ),
    );
  }
}
