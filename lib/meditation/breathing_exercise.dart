import 'package:flutter/material.dart';

class BreathingExerciseScreen extends StatefulWidget {
  @override
  _BreathingExerciseScreenState createState() =>
      _BreathingExerciseScreenState();
}

class _BreathingExerciseScreenState extends State<BreathingExerciseScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isBreathingIn = false;
  int _breathCount = 0;
  bool _isBreathingEnabled = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (_breathCount < 5) {
            _controller.reverse();
            setState(() {
              _isBreathingIn = !_isBreathingIn;
              _breathCount++;
            });
          } else {
            _controller.stop();
            setState(() {
              _isBreathingEnabled = true;
              _breathCount = 0;
            });
          }
        }
      });
    _animation = Tween<double>(begin: 0, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (_isBreathingEnabled) {
      _isBreathingEnabled = false;
      _controller.reset();
      _controller.forward();
    }
  }

  String _getBreathText() {
    if (_animation.value == 0) {
      return 'Breathe out';
    } else {
      return 'Breathe in';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breathing Exercise'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: _animation.value,
              width: _animation.value,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _isBreathingIn ? 'Breathe in' : 'Breathe out',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: _isBreathingEnabled ? _startAnimation : null,
              child: Text(
                _breathCount >= 5 ? 'Complete' : 'Breathe',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
