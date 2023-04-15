import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isRunning = false;
  int _timeLeft = 25 * 60;
  final int _initialTime = 25 * 60;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _initialTime),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _animationController.forward(from: _animationController.value);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft -= 1;
      });
      if (_timeLeft == 0) {
        _animationController.stop(canceled: false);
        _isRunning = false;
        _timeLeft = _initialTime;
        _timer?.cancel();
      }
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
    _animationController.stop(canceled: false);
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Pomodoro\nTimer',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Tap to start!',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
              CircleAvatar(
                backgroundColor: const Color.fromRGBO(20, 120, 75, 1),
                radius: 100,
                child: Center(
                  child: GestureDetector(
                    onTap: _isRunning ? _stopTimer : _startTimer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularPercentIndicator(
                            circularStrokeCap: CircularStrokeCap.round,
                            radius: 55,
                            lineWidth: 5,
                            percent: _timeLeft % 60 / 60,
                            backgroundColor: Colors.transparent,
                            progressColor:
                                const Color.fromRGBO(134, 225, 184, 1),
                            center: CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  const Color.fromRGBO(77, 189, 139, 1),
                              child: Text(
                                '${_timeLeft ~/ 60}:${_timeLeft % 60 < 10 ? '0' : ''}${_timeLeft % 60}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            top: 75,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(96, 153, 102, 1),
            ),
          ),
          const Positioned(
            bottom: 55,
            right: 200,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color.fromRGBO(93, 159, 89, 1),
            ),
          ),
          const Positioned(
            top: 10,
            right: 200,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(157, 192, 139, 1),
            ),
          )
        ],
      ),
    );
  }
}
