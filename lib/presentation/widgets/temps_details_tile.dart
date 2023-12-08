import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/core/utils/string.dart';

class TempDetailsTile extends StatelessWidget {
  final Weather weather;

  const TempDetailsTile({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff001026),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              ' MAX:${StringUtil.getTempAsFormatedString(temp: weather.maxTemperature)}',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
            Text(
              'MIN:${StringUtil.getTempAsFormatedString(temp: weather.minTemperature)}',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
            Text(
              'Feels Like:${StringUtil.getTempAsFormatedString(temp: weather.feelslikeTemperature)}',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
