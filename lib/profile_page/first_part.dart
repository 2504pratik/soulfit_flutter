import 'package:flutter/material.dart';

import 'package:soulfit/profile_page/edit_info.dart';
import '../home_page/home_page.dart';
import '../models/dbHelper.dart';

// ignore: must_be_immutable
class FirstPart extends StatefulWidget {
  const FirstPart({Key? key}) : super(key: key);

  @override
  State<FirstPart> createState() => _FirstPartState();
}

class _FirstPartState extends State<FirstPart> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<String> _loadName() async {
    final users = await SQLHelper.getUsers();
    if (users.isNotEmpty) {
      final name = users[0]['name'];
      _nameController.text = name;
      return name;
    }
    return '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
          FutureBuilder(
            future: _loadName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While data is being loaded
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // If there's an error
                return Text('Error: ${snapshot.error}');
              } else {
                // If data has been loaded successfully
                final name = snapshot.data as String;
                return Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
