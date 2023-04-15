import 'package:flutter/material.dart';
import 'package:soulfit/models/profile.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final Profile _profile = Profile();

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
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle:
                              TextStyle(color: Color.fromRGBO(28, 85, 97, 1)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _profile.name = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Height (cm)',
                          labelStyle:
                              TextStyle(color: Color.fromRGBO(28, 85, 97, 1)),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _profile.height = double.tryParse(value)!;
                          });
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
                        onChanged: (value) {
                          setState(() {
                            _profile.weight = double.tryParse(value)!;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Profession',
                          labelStyle:
                              TextStyle(color: Color.fromRGBO(28, 85, 97, 1)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _profile.profession = value;
                          });
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
