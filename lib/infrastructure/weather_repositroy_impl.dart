import 'package:weather/weather.dart' hide Weather;
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/i_weather_repository.dart';

const String _key = 'eabf5d8815965fd70561f2bf34cf5d55';

class WeatherRepositoryImpl implements IWeatherRepository {
  final WeatherFactory _wf = WeatherFactory(_key);

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
