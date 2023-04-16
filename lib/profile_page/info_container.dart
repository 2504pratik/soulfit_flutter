import 'package:flutter/material.dart';

import '../models/dbHelper.dart';

class InfoContainer extends StatefulWidget {
  const InfoContainer({Key? key}) : super(key: key);

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _professionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadHeight;
    _loadWeight;
    _loadProfession;
  }

  Future<int> _loadHeight() async {
    final users = await SQLHelper.getUsers();
    if (users.isNotEmpty) {
      final height = users[0]['height'] as double;
      _heightController.text = height.toString();
      return height.truncate();
    }
    return 0;
  }

  Future<int> _loadWeight() async {
    final users = await SQLHelper.getUsers();
    if (users.isNotEmpty) {
      final weight = users[0]['weight'] as double;
      _weightController.text = weight.toString();
      return weight.truncate();
    }
    return 0;
  }

  Future<String> _loadProfession() async {
    final users = await SQLHelper.getUsers();
    if (users.isNotEmpty) {
      final profession = users[0]['profession'];
      _professionController.text = profession;
      return profession;
    }
    return '';
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _professionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 8,
              offset: const Offset(1, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(44, 105, 117, 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: FutureBuilder(
                              future: _loadHeight(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // While data is being loaded
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  // If there's an error
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // If data has been loaded successfully
                                  final height = snapshot.data.toString();
                                  return Text(
                                    '$height cm',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Height',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(44, 105, 117, 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: FutureBuilder(
                            future: _loadWeight(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // While data is being loaded
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                // If there's an error
                                return Text('Error: ${snapshot.error}');
                              } else {
                                // If data has been loaded successfully
                                final weight = snapshot.data.toString();
                                return Text(
                                  '$weight kg',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                );
                              }
                            },
                          )),
                        ),
                      ),
                      const Text(
                        'Weight',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Color.fromRGBO(162, 193, 198, 1),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'My Profession:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(44, 105, 117, 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: FutureBuilder(
                      future: _loadProfession(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // While data is being loaded
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // If there's an error
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // If data has been loaded successfully
                          final profession = snapshot.data as String;
                          return Text(
                            profession,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          );
                        }
                      },
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
