import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weatheris/features/weather/presentation/pages/weather_home.dart';

void main() {
  runApp(const Weatheris());
}

class Weatheris extends StatelessWidget {
  const Weatheris({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weatheris',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeatherHome(),
    );
  }
}
