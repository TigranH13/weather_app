import 'package:weather/weather.dart' hide Weather;
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/i_weather_repository.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  static const String _openWeatherKey = 'eabf5d8815965fd70561f2bf34cf5d55';
  final WeatherFactory _wf = WeatherFactory(_openWeatherKey);

  @override
  Future<List<Weather>> getForecast({required String cityName}) async {
    final fiveDayForecastByCityName =
        await _wf.fiveDayForecastByCityName(cityName);
    final List<Weather> weatherForecast = [];

    for (var e in fiveDayForecastByCityName) {
      weatherForecast.add(
        Weather(
          feelslikeTemperature: e.tempFeelsLike!.celsius!,
          minTemperature: e.tempMin!.celsius!,
          maxTemperature: e.tempMax!.celsius!,
          cityName: cityName,
          temperature: e.temperature!.celsius!,
          mainCondition: e.weatherMain!,
          date: e.date!,
        ),
      );
    }

    return weatherForecast;
  }
}
