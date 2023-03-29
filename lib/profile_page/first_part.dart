import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
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
                IconButton(
                  onPressed: (() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(
                            height: 500,
                            width: 400,
                            child: AlertDialog(
                              actions: [
                                Center(
                                  child: ElevatedButton(
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
                              title: const Text('Edit Info'),
                              content: Column(
                                  children: const [TextField(), TextField()]),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
