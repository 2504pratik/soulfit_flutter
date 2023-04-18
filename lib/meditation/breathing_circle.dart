import 'dart:async';
import 'package:flutter/material.dart';

class BreathingCircle extends StatefulWidget {
  final String textIn;
  final String textOut;
  final int breathDuration;

  const BreathingCircle(
      {Key? key,
      this.textIn = "Breathe \nIN",
      this.textOut = "Breathe \nOUT",
      this.breathDuration = 4000})
      : super(key: key);

  @override
  _BreathingCircleState createState() => _BreathingCircleState();
}

class _BreathingCircleState extends State<BreathingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isBreathingIn = true;
  bool _isAnimating = false;
  int _breathCount = 0;
  final int _maxBreaths = 5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.breathDuration),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _isBreathingIn = !_isBreathingIn;
          _controller.reset();
          _breathCount++;
          if (_breathCount < _maxBreaths * 2) {
            Timer(const Duration(milliseconds: 100), () {
              if (_isAnimating) {
                _controller.forward();
              }
            });
          } else {
            _breathCount = 0;
            _isAnimating = false;
          }
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startStopAnimation() {
    setState(() {
      if (_isAnimating) {
        _isAnimating = false;
        _controller.stop();
      } else {
        _isAnimating = true;
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 300.0,
          height: 300.0,
          child: CustomPaint(
            painter: BreathingPainter(_animation.value, _isBreathingIn, 2),
            child: Center(
              child: Text(
                _isBreathingIn ? widget.textIn : widget.textOut,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        IconButton(
          iconSize: 50,
          onPressed: _startStopAnimation,
          icon: Icon(
            _isAnimating ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class BreathingPainter extends CustomPainter {
  final double value;
  final bool isBreathingIn;
  final double ringSize;

  BreathingPainter(this.value, this.isBreathingIn, this.ringSize);

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2.0;
    double adjustedValue = isBreathingIn ? value : 1 - value;
    double animatedValue = Curves.easeInOut.transform(adjustedValue);
    Rect rect = Rect.fromCenter(
      center: Offset(size.width / 2.0, size.height / 2.0),
      width: size.width * animatedValue,
      height: size.height * animatedValue,
    );
    Paint ringPaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = ringSize;
    canvas.drawCircle(
        Offset(radius, radius), (radius + 20) - ringSize / 2, ringPaint);
    Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF318FDC),
          const Color(0xFFFFFFFF).withOpacity(0.5),
        ],
      ).createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(radius, radius), radius * animatedValue, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
