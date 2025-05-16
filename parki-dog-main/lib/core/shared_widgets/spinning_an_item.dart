import 'dart:math' as math;

import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class SpinningAnItemWidget extends StatefulWidget {
  final Widget widget;
  final Duration duration;

  const SpinningAnItemWidget(
      {super.key,
      required this.widget,
      this.duration = const Duration(seconds: AppInt.i5)});

  @override
  State<SpinningAnItemWidget> createState() => _SpinningAnItemWidgetState();
}

class _SpinningAnItemWidgetState extends State<SpinningAnItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * AppDouble.d2 * math.pi,
            child: child,
          );
        },
        child: widget.widget,
      )),
    );
  }
}
