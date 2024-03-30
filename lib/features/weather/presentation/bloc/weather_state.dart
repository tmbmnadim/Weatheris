part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  final WeatherEntity? weatherData;
  final DioException? exception;

  const WeatherState({this.weatherData, this.exception});

  @override
  List<Object> get props => [weatherData!, exception!];
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

final class WeatherSuccess extends WeatherState {
  const WeatherSuccess(WeatherEntity weatherData)
      : super(weatherData: weatherData);
}

final class WeatherFailure extends WeatherState {
  const WeatherFailure(DioException exception): super(exception: exception);
}
