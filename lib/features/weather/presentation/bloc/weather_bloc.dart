import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weatheris/features/weather/domain/entities/weather_entity.dart';
import 'package:weatheris/features/weather/domain/usecases/get_weather.dart';
import 'package:weatheris/core/resources/data_state.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase _getWeatherUseCase;
  final Position _position;
  final String? _language;

  WeatherBloc(this._getWeatherUseCase, this._position, this._language) : super(const WeatherLoading()) {
    on<FetchWeather>(onGetWeather);
  }

  onGetWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    try {

      final DataState<WeatherEntity> dataState =
          await _getWeatherUseCase(latitude: _position.latitude,longitude:  _position.longitude, language: _language);


      if(dataState is DataSuccess && dataState.data!.list.isNotEmpty){
        emit(WeatherSuccess(dataState.data!));
      }
    } on DioException catch (exception) {
      emit(WeatherFailure(exception));
    }
  }
}
