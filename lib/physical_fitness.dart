import 'package:flutter/material.dart';

class PhysicalFitness extends StatelessWidget {
  const PhysicalFitness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physical Fitness Tab'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text('click me'),
        ),
      ),
    );
  }
}
