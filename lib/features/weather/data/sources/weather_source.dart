import 'package:dio/dio.dart';
import 'package:weatheris/features/weather/data/models/weather_model.dart';

class WeatherSource {
  WeatherSource() {
    baseUrl == "http://api.openweathermap.org/data/2.5/forecast";
  }

  final Dio _dio = Dio();

  String baseUrl = "http://api.openweathermap.org/data/2.5/forecast";

  Future<Response<WeatherModel>> getWeatherData(
    String apiKey,
    double latitude,
    double longitude,
    String? language,
  ) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'appid': apiKey,
      r'lat': latitude,
      r'lon': longitude,
      r'lang': language ?? "EN",
    };
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};

    final result = await _dio.get(
        "$baseUrl?lat=$latitude&lon=$longitude&lang=$language&units=metric&appid=$apiKey",
        data: data,
        queryParameters: queryParameters);

    final WeatherModel value = WeatherModel.fromJson(result.data);

    Response<WeatherModel> output = Response<WeatherModel>(
      requestOptions: RequestOptions(),
      statusCode: result.statusCode,
      statusMessage: result.statusMessage,
      data: value,
      headers: result.headers,
      extra: result.extra,
    );
    return output;
  }
}
