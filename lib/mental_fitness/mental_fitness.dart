import 'package:flutter/material.dart';
import 'package:soulfit/mental_fitness/daily_goals/daily_goals.dart';
import 'package:soulfit/mental_fitness/first.dart';
import 'package:soulfit/mental_fitness/second.dart';
import 'package:soulfit/mental_fitness/tasks/task.dart';

class MentalFitness extends StatelessWidget {
  const MentalFitness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(77, 189, 139, 1),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const First(),
          const Pomodoro(),
          const Task(),
          HabitTrackerContainer()
        ],
      )),
    );
  }
}
