import 'package:equatable/equatable.dart';
import 'package:weatheris/core/usecase/usecase.dart';
import 'package:weatheris/features/weather/domain/entities/weather_entity.dart';
import 'package:weatheris/core/resources/data_state.dart';
import 'package:weatheris/features/weather/domain/repository/weather_repository.dart';

class GetWeatherUseCase
    implements UseCase<DataState<WeatherEntity>, Params> {
  WeatherRepository weatherRepository;

  GetWeatherUseCase(this.weatherRepository);
  @override
  Future<DataState<WeatherEntity>> call({
    required double latitude,
    required double longitude,
    String? language,
  }) {
    return weatherRepository.getCurrentWeather(
      latitude,
      longitude,
      language,
    );
  }
}

class Params extends Equatable {
  final double latitude;
  final double longitude;
  final String? language;
  const Params({
    required this.latitude,
    required this.longitude,
    this.language,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        language,
      ];
}
