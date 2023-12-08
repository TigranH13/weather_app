import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/application/weather_bloc.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/core/extensions/weather_state_extension.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast_grid.dart';
import 'package:weather_app/presentation/widgets/temps_details_tile.dart';
import 'package:weather_app/presentation/widgets/weather_condition_animated_icon.dart';

class DailyDetailScreen extends StatelessWidget {
  final DateTime date;

  const DailyDetailScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xff134CB5),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return state.map(
            failed: (value) => Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<WeatherBloc>().add(
                        const WeatherEvent.init(),
                      );
                },
                child: const Text('Retry'),
              ),
            ),
            inProgress: (value) => const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
            success: (succes) {
              final List<Weather> hourlyForecast =
                  succes.getHourlyForecast(date: date);
              final Weather firstWeather = hourlyForecast[0];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: firstWeather.date,
                        child: WeatherConditionAnimatedIcon(
                          mainCondition: firstWeather.mainCondition,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TempDetailsTile(weather: firstWeather),
                      const SizedBox(height: 20),
                      HourlyForecastGrid(hourlyForecast: hourlyForecast),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
