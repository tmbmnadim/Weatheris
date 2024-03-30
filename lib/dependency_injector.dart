import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:weatheris/features/weather/data/repository/weather_repository.dart';
import 'package:weatheris/features/weather/data/sources/weather_source.dart';
import 'package:weatheris/features/weather/domain/repository/weather_repository.dart';
import 'package:weatheris/features/weather/domain/usecases/get_weather.dart';
import 'package:weatheris/features/weather/presentation/bloc/weather_bloc.dart';

final GetIt sl = GetIt.instance;
// final GetIt sl2 = GetIt.instance(param1: Position, param2: String);

void initDependencies(Position position, String? language) {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<WeatherSource>(WeatherSource());
  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase(sl()));

  //blocs
  sl.registerSingleton<WeatherBloc>(WeatherBloc(
    sl(),
    position,
    language,
  ));
}
