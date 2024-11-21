import 'package:flutter/material.dart';

class RotateAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double beginAngle;
  final double endAngle;

  const RotateAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.beginAngle = 0.0,
    this.endAngle = 1.0, // 1.0 means one full rotation
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: beginAngle, end: endAngle),
      duration: duration,
      builder: (context, double angle, child) {
        return Transform.rotate(
          angle: angle * 3.14159265, // Convert to radians
          child: child,
        );
      },
      child: child,
    );
  }
}
