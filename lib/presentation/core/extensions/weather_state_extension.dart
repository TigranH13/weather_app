import 'package:weather_app/application/weather_bloc.dart';
import 'package:weather_app/domain/entities/weather.dart';

extension WeatherBlocExstnetion on Success {
  List<Weather> getHourlyForecast({required DateTime date}) {
    return weatherForecast.where((e) => e.date.day == date.day).toList();
  }

  List<Weather> get geDailyForecast {
    final List<Weather> weatherDailyForecast = [];

    for (var e in weatherForecast) {
      bool dateExists = weatherDailyForecast
          .any((element) => (element.date.day == e.date.day));

      if (!dateExists && e.date.day > DateTime.now().day) {
        weatherDailyForecast.add(e);
      }
    }

    return weatherDailyForecast;
  }
}
