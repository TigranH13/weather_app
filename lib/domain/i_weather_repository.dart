import 'package:weather_app/domain/entities/weather.dart';

abstract interface class IWeatherRepository {
  Future<List<Weather>> getForecast({required String cityName});
}
