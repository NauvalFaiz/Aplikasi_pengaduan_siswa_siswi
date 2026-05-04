import 'package:flutter/material.dart';

class CircleStyle extends StatelessWidget {
  final double size;
  final Color color;
  final bool isGlass;
  final Widget? child;

  const CircleStyle({
    super.key,
    required this.size,
    required this.color,
    this.isGlass = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isGlass) {
      return SizedBox(
        width: size,
        height: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            gradient: RadialGradient(
              colors: [color, color.withOpacity(0.0)],
              stops: [0.0, 1.0],
            ),
            boxShadow: [
              BoxShadow(color: color, blurRadius: 14.3,
              spreadRadius: 14.3),
            ],
          ),
          child: child,
        ),
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: child,
      ),
    );
  }
}
