part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.inProgress() = _InProgress;

  const factory WeatherState.success(List<Weather> weatherForecast) = Success;

  const factory WeatherState.failed(String message) = _Failed;
}
