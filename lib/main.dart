import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatheris/config/theme/app_theme.dart';
import 'package:weatheris/dependency_injector.dart';
import 'package:weatheris/features/weather/presentation/pages/weather_home.dart';
import 'features/weather/presentation/bloc/weather_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Position position = await _determinePosition();
  initDependencies(position, "English");
  runApp(const WeatherIs());
}

class WeatherIs extends StatelessWidget {
  const WeatherIs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherIs',
      theme: theme(),
      home: BlocProvider<WeatherBloc>(
        create: (context) => sl()..add(const FetchWeather()),
        child: const WeatherHome(),
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }
  return await Geolocator.getCurrentPosition();
}
