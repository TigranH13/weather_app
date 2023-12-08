import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/core/utils/animation.dart';
import 'package:weather_app/presentation/core/utils/string.dart';
import 'package:weather_app/presentation/screens/daily_detail_screen.dart';
import 'package:weather_app/presentation/widgets/weather_condition_animated_icon.dart';

class DailyForecastGrid extends StatelessWidget {
  final List<Weather> dailyForecast;

  const DailyForecastGrid({required this.dailyForecast, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff001026),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Next ForeCasts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: dailyForecast.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    AnimationUtils.createAnimatedRoute(
                      DailyDetailScreen(
                      
                        date: dailyForecast[index].date,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringUtil.getWeekDayAsString(
                            dateTime: dailyForecast[index].date),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Hero(
                        tag: dailyForecast[index].date,
                        child: WeatherConditionAnimatedIcon(
                          mainCondition: dailyForecast[index].mainCondition,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        StringUtil.getTempAsFormatedString(
                          temp: dailyForecast[index].temperature,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
