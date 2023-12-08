class Weather {
  final String cityName;
  final double temperature;
  final double maxTemperature;
  final double minTemperature;
  final double feelslikeTemperature;
  final String mainCondition;
  final DateTime date;

  Weather({
    required this.maxTemperature,
    required this.minTemperature,
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.feelslikeTemperature,
    required this.date,
  });
}
