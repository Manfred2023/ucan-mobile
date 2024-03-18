import 'package:flutter/material.dart';

class SmartAnimatePageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    Route<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: const Interval(0.0, 0.75,
            curve: Curves.easeOut), // Animation Smart animate
      ),
      child: child,
    );
  }
}

class SmartAnimateTransition extends StatelessWidget {
  final Animation<double> animation;
  final Curve curve;
  final Widget child;

  const SmartAnimateTransition({
    super.key,
    required this.animation,
    this.curve = Curves.linear,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0), // Début de l'animation (visible à l'écran)
        end: const Offset(0, 0), // Fin de l'animation (position initiale)
      ).animate(CurvedAnimation(parent: animation, curve: curve)),
      child: child,
    );
  }
}
