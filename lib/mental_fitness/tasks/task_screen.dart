import 'package:flutter/material.dart';
import 'package:soulfit/mental_fitness/tasks/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String> tasks = [];
  List<bool> isCheckedList = [];

  void _addTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String taskTitle = '';
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            cursorColor: Colors.green,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Enter task title',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              fillColor: Colors.green,
              filled: false,
            ),
            onChanged: (value) {
              taskTitle = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.green, fontSize: 17),
              ),
            ),
            TextButton(
              onPressed: () {
                if (taskTitle.isNotEmpty) {
                  setState(() {
                    tasks.add(taskTitle);
                    isCheckedList.add(false);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.green, fontSize: 17),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 118, 70, 1),
      body: Stack(children: [
        const Positioned(
          top: 200,
          right: -200,
          child: CircleAvatar(
            radius: 180,
            backgroundColor: Color.fromRGBO(15, 75, 50, 1),
          ),
        ),
        const Positioned(
          bottom: -30,
          left: -60,
          child: CircleAvatar(
            radius: 120,
            backgroundColor: Color.fromRGBO(15, 75, 50, 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Task())));
                    },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(10, 118, 70, 1))),
                    child: Image.asset("assets/images/MentalFit_backBtn.png"),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Text(
                    'Add a task',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  textAlign: TextAlign.center,
                  '“Subtracting from your list of priorities is as important as adding to it.”',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(tasks[index],
                            style: isCheckedList[index]
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.white60,
                                    fontSize: 25)
                                : const TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 25)),
                        leading: Checkbox(
                          value: isCheckedList[index],
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              isCheckedList[index] = value!;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 200,
          width: MediaQuery.of(context).size.width,
          child: FloatingActionButton(
            onPressed: _addTask,
            backgroundColor: const Color.fromRGBO(24, 241, 145, 1),
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ]),
    );
  }
}
