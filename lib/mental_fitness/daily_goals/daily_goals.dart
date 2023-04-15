import 'package:flutter/material.dart';

class HabitTrackerContainer extends StatefulWidget {
  const HabitTrackerContainer({Key? key}) : super(key: key);

  @override
  _HabitTrackerContainerState createState() => _HabitTrackerContainerState();
}

class _HabitTrackerContainerState extends State<HabitTrackerContainer> {
  int tasksCompleted = 0;

  @override
  Widget build(BuildContext context) {
    double progressValue = tasksCompleted / 4;
    Color uncompletedColor = const Color.fromRGBO(134, 225, 184, 0.6);
    Color completedColor = const Color.fromRGBO(44, 112, 82, 1);

    return Container(
      height: 350,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Habits',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 125.0,
                      height: 125.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: uncompletedColor,
                      ),
                      child: Center(
                        child: Text(
                          '${(progressValue * 100).toInt()}%',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: CircularProgressIndicator(
                        value: progressValue,
                        backgroundColor: uncompletedColor,
                        valueColor: AlwaysStoppedAnimation(completedColor),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Today's goals are \nalmost done!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Even a small habit can create \na great impact on the future. ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTaskContainer('Task 1', 0, 'Health'),
                  _buildTaskContainer('Task 2', 1, 'Knowledge'),
                  _buildTaskContainer('Task 3', 2, 'Walk'),
                  _buildTaskContainer('Task 4', 3, 'Fun'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskContainer(String taskName, int taskIndex, String title) {
    bool isCompleted = tasksCompleted > taskIndex;
    return Container(
      width: 300.0,
      height: 110.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: 90,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(97, 159, 210, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Text(
                'Drink 8 glasses of water',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                child: isCompleted
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            tasksCompleted--;
                          });
                        },
                        child: const Text(
                          'Completed!',
                          style:
                              TextStyle(color: Color.fromRGBO(67, 150, 140, 1)),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          setState(() {
                            tasksCompleted++;
                          });
                        },
                        child: const Text('Complete',
                            style: TextStyle(
                                color: Color.fromRGBO(97, 159, 210, 1))),
                      ),
              )
            ],
          ),
          Image.asset('assets/images/glass.png')
        ],
      ),
    );
  }
}
