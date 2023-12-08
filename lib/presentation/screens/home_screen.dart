import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/application/weather_bloc.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/presentation/core/extensions/weather_state_extension.dart';
import 'package:weather_app/presentation/widgets/custom_search_delegate.dart';
import 'package:weather_app/presentation/widgets/daily_forecast_grid.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast_grid.dart';
import 'package:weather_app/presentation/widgets/temps_details_tile.dart';
import 'package:weather_app/presentation/widgets/weather_condition_animated_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: CitySearchDelegate()),
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
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
                  succes.getHourlyForecast(date: DateTime.now());
              final List<Weather> dailyForecast = succes.geDailyForecast;
              final Weather firstWeather = hourlyForecast[0];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        firstWeather.cityName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      WeatherConditionAnimatedIcon(
                        mainCondition: firstWeather.mainCondition,
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(height: 5),
                      TempDetailsTile(weather: firstWeather),
                      const SizedBox(height: 20),
                      HourlyForecastGrid(hourlyForecast: hourlyForecast),
                      const SizedBox(height: 20),
                      DailyForecastGrid(dailyForecast: dailyForecast),
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





