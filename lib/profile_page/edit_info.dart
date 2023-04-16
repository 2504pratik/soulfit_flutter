import 'package:flutter/material.dart';

import '../models/dbHelper.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  var _nameController = TextEditingController();
  late double height;
  late double weight;
  late String profession;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    fetchName();
  }

  void fetchName() async {
    final db = await SQLHelper.db();
    final users = await db.query('user');
    if (users.isNotEmpty) {
      final name = users[0]['name'] as String;
      _nameController.text = name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: SizedBox(
                height: 450,
                width: 350,
                child: SingleChildScrollView(
                  child: AlertDialog(
                    backgroundColor: Colors.white,
                    actions: [
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(28, 85, 97, 1)),
                          ),
                          child: const Text('Save'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    content: Column(children: [
                      // TextField(
                      //   decoration: const InputDecoration(
                      //     labelText: 'Name',
                      //     labelStyle:
                      //         TextStyle(color: Color.fromRGBO(28, 85, 97, 1)),
                      //   ),
                      //   onChanged: (value) {},
                      // ),
                      // const SizedBox(height: 16.0),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Height (cm)',
                          labelStyle:
                              TextStyle(color: Color.fromRGBO(28, 85, 97, 1)),
                        ),
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) async {
                          final height = double.parse(value);
                          setState(() {
                            this.height = height;
                          });
                          await SQLHelper.updateHeight(
                              height, _nameController.text);
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Weight (kg)',
                          labelStyle:
                              TextStyle(color: Color.fromRGBO(28, 85, 97, 1)),
                        ),
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) async {
                          final weight = double.parse(value);
                          setState(() {
                            this.weight = weight;
                          });
                          await SQLHelper.updateWeight(
                              weight, _nameController.text);
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Profession',
                          labelStyle:
                              TextStyle(color: Color.fromRGBO(28, 85, 97, 1)),
                        ),
                        onSubmitted: (value) async {
                          final profession = value;
                          setState(() {
                            this.profession = profession;
                          });
                          await SQLHelper.updateProfession(
                              profession, _nameController.text);
                        },
                      ),
                    ]),
                  ),
                ),
              ),
            );
          },
        );
      }),
      icon: const Icon(
        Icons.edit,
        color: Color.fromRGBO(28, 85, 97, 1),
      ),
    );
  }
}
