import 'package:flutter/material.dart';

class ExtraPart extends StatelessWidget {
  const ExtraPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: const Color.fromRGBO(77, 136, 145, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'Privacy Policy',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
