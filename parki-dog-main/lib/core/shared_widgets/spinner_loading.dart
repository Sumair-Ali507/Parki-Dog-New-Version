import 'dart:math';

import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class SpinnerLoading extends StatefulWidget {
  /// x is the speed of the spinner if x=.5 it will be 2 times faster
  final double x;
  final Color color;
  const SpinnerLoading(
      {super.key, this.x = AppDouble.d0_5, this.color = Colors.blue});

  @override
  State<SpinnerLoading> createState() => _SpinnerLoadingState();
}

class _SpinnerLoadingState extends State<SpinnerLoading>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  late AnimationController fifthController;
  late Animation<double> fifthAnimation;

  @override
  void initState() {
    super.initState();

    firstController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (AppInt.i6000 * widget.x).toInt()));
    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(firstController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (AppInt.i3000 * widget.x).toInt()));
    secondAnimation =
        Tween<double>(begin: -pi, end: pi).animate(secondController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              secondController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              secondController.forward();
            }
          });

    thirdController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (AppInt.i2000 * widget.x).toInt()));
    thirdAnimation = Tween<double>(begin: -pi, end: pi).animate(thirdController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (AppInt.i1500 * widget.x).toInt()));
    fourthAnimation =
        Tween<double>(begin: -pi, end: pi).animate(fourthController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              fourthController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              fourthController.forward();
            }
          });

    fifthController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (AppInt.i1000 * widget.x).toInt()));
    fifthAnimation = Tween<double>(begin: -pi, end: pi).animate(fifthController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fifthController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          fifthController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
    thirdController.forward();
    fourthController.forward();
    fifthController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDouble.d100,
      width: AppDouble.d100,
      child: CustomPaint(
        painter: MyPainter(
            firstAnimation.value,
            secondAnimation.value,
            thirdAnimation.value,
            fourthAnimation.value,
            fifthAnimation.value,
            widget.color),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstAngle;
  final double secondAngle;
  final double thirdAngle;
  final double fourthAngle;
  final double fifthAngle;
  final Color color;
  MyPainter(this.firstAngle, this.secondAngle, this.thirdAngle,
      this.fourthAngle, this.fifthAngle, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint myArc = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppDouble.d5
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTRB(
        AppDouble.d0,
        AppDouble.d0,
        size.width,
        size.height,
      ),
      firstAngle,
      AppDouble.d2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * AppDouble.d0_1,
        size.height * AppDouble.d0_1,
        size.width * AppDouble.d0_9,
        size.height * AppDouble.d0_9,
      ),
      secondAngle,
      AppDouble.d2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * AppDouble.d0_2,
        size.height * AppDouble.d0_2,
        size.width * AppDouble.d0_8,
        size.height * AppDouble.d0_8,
      ),
      thirdAngle,
      AppDouble.d2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * AppDouble.d0_3,
        size.height * AppDouble.d0_3,
        size.width * AppDouble.d0_7,
        size.height * AppDouble.d0_7,
      ),
      fourthAngle,
      AppDouble.d2,
      false,
      myArc,
    );
    canvas.drawArc(
      Rect.fromLTRB(
        size.width * AppDouble.d0_4,
        size.height * AppDouble.d0_4,
        size.width * AppDouble.d0_6,
        size.height * AppDouble.d0_6,
      ),
      fifthAngle,
      AppDouble.d2,
      false,
      myArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
