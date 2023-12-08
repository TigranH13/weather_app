import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/presentation/core/utils/animation.dart';

class WeatherConditionAnimatedIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final String mainCondition;

  const WeatherConditionAnimatedIcon({
    required this.mainCondition,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AnimationUtils.getWetherAnimationName(mainCondition),
        width: width,
        height: height,
      ),
    );
  }
}
