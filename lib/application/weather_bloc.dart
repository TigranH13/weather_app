import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/utils/geo.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/i_weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherRepository weatherRepositoryImpl;

  WeatherBloc(this.weatherRepositoryImpl)
      : super(const WeatherState.inProgress()) {
    on<_Init>(_init);
    on<_GetForecastByCityName>(_onGetForecastByCityName);
  }

  Future<void> _init(
    _Init event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      final cityName = await GeoUtil.getCurrentCity();

      final wheathers = await weatherRepositoryImpl.getForecast(
        cityName: cityName,
      );

      emit(WeatherState.success(wheathers));
    } catch (e) {
      emit(const WeatherState.failed('Somthing when wrong axper jan'));
    }
  }

  Future<void> _onGetForecastByCityName(
    _GetForecastByCityName event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherState.inProgress());

    try {
      final wheathers = await weatherRepositoryImpl.getForecast(
        cityName: event.cityName,
      );

      emit(WeatherState.success(wheathers));
    } catch (e) {
      emit(const WeatherState.failed('Somthing when wrong axper jan'));
    }
  }
}
