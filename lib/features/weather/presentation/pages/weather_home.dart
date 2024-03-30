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
        title: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherSuccess) {
              return Text(state.weatherData!.list[0].dtTxt.toString());
            } else if (state is WeatherFailure) {
              return Text(state.exception.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
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
                      var weatherList = state.weatherData!.list[0];

                      return WeatherScreen(
                        weatherIcon: weatherList.weather[0].icon,
                        areaName:
                            "${state.weatherData!.city.name == "Bangsal" ? "Dhaka" : state.weatherData!.city.name}, ${state.weatherData!.city.country}",
                        weatherDescription: weatherList.weather[0].main,
                        temp: "${weatherList.main.temp} °C",
                        windStatus: weatherList.weather[0].description,
                        feelsLike: weatherList.main.feelsLike.toString(),
                        windDirection:
                            "${weatherList.wind.deg}° from the North",
                        pressure: "${weatherList.main.pressure} hPa",
                        humidity: weatherList.main.humidity.toString(),
                        dewpoint: weatherList.main.humidity.toString(),
                        visibility:
                            "${(weatherList.visibility / 1000).toStringAsFixed(0)} km",
                        speed: "${weatherList.wind.speed} m/s",
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
