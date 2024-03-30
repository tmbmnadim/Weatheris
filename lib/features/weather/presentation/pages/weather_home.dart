import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatheris/config/theme/app_theme.dart';
import 'package:weatheris/features/weather/presentation/widgets/weather_screen.dart';

import '../bloc/weather_bloc.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mar 15, 08:21pm"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                primaryColor,
                secondaryColor,
              ],
              stops: const [0.6, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.only(top: scrSize.height * 0.09),
        child: SingleChildScrollView(
          child: Container(
            height: scrSize.height * 0.91,
            width: scrSize.width,
            color: secondaryColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: SizedBox(
                width: scrSize.width,
                height: scrSize.height,
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherSuccess) {
                      return WeatherScreen(
                        weatherIcon:
                            state.weatherData!.list[0].weather[0].icon,
                        areaName: "${state.weatherData!.city.name}, ${state.weatherData!.city.country}",
                        weatherDescription: state.weatherData!.list[0].weather[0].main,
                        temp: "${state.weatherData!.list[0].main.temp} °C",
                        windStatus: state.weatherData!.list[0].weather[0].description,
                        feelsLike: state.weatherData!.list[0].main.feelsLike.toString(),
                        windDirection: state.weatherData!.list[0].wind.deg.toString(),
                        pressure: state.weatherData!.list[0].main.pressure.toString(),
                        humidity: state.weatherData!.list[0].main.humidity.toString(),
                        dewpoint: state.weatherData!.list[0].main.humidity.toString(),
                        visibility: state.weatherData!.list[0].visibility.toString(),
                        speed: "${state.weatherData!.list[0].wind.speed} m/s",
                      );
                    } else if (state is WeatherFailure) {
                      return Center(
                        child: SizedBox(
                          child: Text(
                            state.exception!.message.toString(),
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 10,
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
