import 'dart:math';
import 'package:flutter/material.dart';

class RippleLoading extends StatefulWidget {
  final double radius;
  final Color color;

  const RippleLoading({super.key, this.radius = 50, this.color = Colors.green});

  @override
  State<RippleLoading> createState() => _RippleLoadingState();
}

class _RippleLoadingState extends State<RippleLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * widget.radius,
      width: 2 * widget.radius,
      child: CustomPaint(
        painter: MyCustomPainter(_animation.value, widget.color),
        child: Container(),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double animationValue;
  final Color animationColor;

  MyCustomPainter(this.animationValue, this.animationColor);

  @override
  void paint(Canvas canvas, Size size) {
    for (int value = 3; value >= 0; value--) {
      circle(canvas, Rect.fromLTRB(0, 0, size.width, size.height),
          value + animationValue);
    }
  }

  void circle(Canvas canvas, Rect rect, double value) {
    Paint paint = Paint()
      ..color = animationColor.withOpacity((1 - (value / 4)).clamp(.0, 1));

    canvas.drawCircle(rect.center,
        sqrt((rect.width * .5 * rect.width * .5) * value / 4), paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return true;
  }
}
