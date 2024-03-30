part of 'weather_bloc.dart';

sealed class WeatherEvent{
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent {
  // final Position position;

  const FetchWeather();
}
