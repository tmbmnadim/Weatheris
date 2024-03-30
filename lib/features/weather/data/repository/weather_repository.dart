import 'package:dio/dio.dart';
import 'package:weatheris/core/constants.dart';
import 'package:weatheris/core/resources/data_state.dart';
import 'package:weatheris/features/weather/data/sources/weather_source.dart';
import 'package:weatheris/features/weather/domain/repository/weather_repository.dart';

import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherSource _weatherSource;

  WeatherRepositoryImpl(this._weatherSource);

  @override
  Future<DataState<WeatherModel>> getCurrentWeather(
    double latitude,
    double longitude,
    String? language,
  ) async {
    try {
      final Response<WeatherModel> response = await _weatherSource
          .getWeatherData(weatherApikey, latitude, longitude, language);
      if (response.statusCode == 200) {
        return DataSuccess(response.data!);
      } else {
        return DataFailed(
          DioException(
            error: response.statusMessage,
            response: response,
            type: DioExceptionType.badResponse,
            requestOptions: response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
