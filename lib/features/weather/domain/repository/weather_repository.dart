import 'package:weatheris/features/weather/domain/entities/weather_entity.dart';
import '/core/resources/data_state.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherEntity>> getCurrentWeather(
    double latitude,
    double longitude,
    String? language,
  );
}
