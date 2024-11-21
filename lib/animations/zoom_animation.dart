import 'package:flutter/material.dart';

class ZoomAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;

  const ZoomAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.begin = 0.0,
    this.end = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: begin, end: end),
      duration: duration,
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: child,
    );
  }
}
