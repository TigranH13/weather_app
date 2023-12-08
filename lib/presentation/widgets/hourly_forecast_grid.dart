import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/core/utils/string.dart';
import 'package:weather_app/presentation/widgets/weather_condition_animated_icon.dart';

class HourlyForecastGrid extends StatelessWidget {
  final List<Weather> hourlyForecast;

  const HourlyForecastGrid({super.key, required this.hourlyForecast});

  @override
  Widget build(BuildContext context) {
    final Weather firstWeather = hourlyForecast[0];
    final bool isCurrentWeather = firstWeather.date.day == DateTime.now().day;
    final String weekDay = isCurrentWeather
        ? 'Today'
        : StringUtil.getWeekDayAsString(dateTime: firstWeather.date);
    final String monthDay = StringUtil.getMonthAndDayAsString(
      dateTime: firstWeather.date,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff001026),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weekDay,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                Text(
                  monthDay,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: hourlyForecast.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 4,
              crossAxisCount: hourlyForecast.length,
              childAspectRatio: 1 / (hourlyForecast.length / 2),
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      StringUtil.getTempAsFormatedString(
                        temp: hourlyForecast[index].temperature,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    WeatherConditionAnimatedIcon(
                      mainCondition: hourlyForecast[index].mainCondition,
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      ' ${hourlyForecast[index].date.hour.round().toString()}.00',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
