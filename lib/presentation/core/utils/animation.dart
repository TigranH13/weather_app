import 'package:flutter/material.dart';

abstract class AnimationUtils {
  static String getWetherAnimationName(String mainCondition) {
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/animations/clound.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/animations/rain.json';
      default:
        return 'assets/animations/sunny.json';
    }
  }

  static PageRouteBuilder<Widget> createAnimatedRoute(Widget screen) {
    return PageRouteBuilder<Widget>(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 700),
        reverseTransitionDuration: const Duration(milliseconds: 700));
  }
}
