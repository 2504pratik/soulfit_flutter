import 'package:flutter/material.dart';

import 'package:soulfit/profile_page/profile_page.dart';

class RewardsAppBar extends StatelessWidget {
  const RewardsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(44, 105, 117, 1),
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(44, 105, 117, 1))),
                onPressed: () {
                  Navigator.of(context).pop(MaterialPageRoute(
                    builder: (context) => const UserProfile(),
                  ));
                },
                child: Image.asset('assets/images/back_btn.png'),
              ),
              const Text(
                'Your Rewards',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.info_rounded,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'No rewards yet!',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
