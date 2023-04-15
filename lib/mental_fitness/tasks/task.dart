import 'package:flutter/material.dart';
import 'package:soulfit/mental_fitness/tasks/task_screen.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(23, 117, 75, 1),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'MY TASKS:',
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TaskScreen(),
                        ));
                      },
                      icon: const Icon(
                        Icons.double_arrow_rounded,
                        color: Colors.white70,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
