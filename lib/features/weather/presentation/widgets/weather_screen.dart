import 'package:flutter/material.dart';
import 'package:weatheris/features/weather/presentation/widgets/small_card.dart';

import '../../../../config/theme/app_theme.dart';

class WeatherScreen extends StatelessWidget {
  final String weatherIcon;
  final String areaName;
  final String weatherDescription;
  final String temp;
  final String windStatus;
  final String feelsLike;
  final String windDirection;
  final String pressure;
  final String humidity;
  final String dewpoint;
  final String visibility;
  final String speed;

  const WeatherScreen({
    super.key,
    required this.weatherIcon,
    required this.areaName,
    required this.weatherDescription,
    required this.temp,
    required this.windStatus,
    required this.feelsLike,
    required this.windDirection,
    required this.pressure,
    required this.humidity,
    required this.dewpoint,
    required this.visibility,
    required this.speed,
  });

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: scrSize.width),
        SizedBox(
          width: scrSize.width,
          child: Center(
            child: Text(
              areaName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 220,
          height: 220,
          child: Stack(
            children: [
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white70,
                      blurRadius: 10,
                      spreadRadius: -5,
                    )
                  ],
                ),
              ),
              Positioned(
                top: -15,
                left: 20,
                child: Image.network(
                  "https://openweathermap.org/img/wn/$weatherIcon@2x.png",
                  color: Colors.black26,
                  scale: 0.55,
                ),
              ),
              Positioned(
                top: -30,
                child: Image.network(
                  "https://openweathermap.org/img/wn/$weatherIcon@2x.png",
                  scale: 0.5,
                ),
              ),
              Positioned(
                left: 10,
                bottom: 15,
                child: SizedBox(
                  width: 200,
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor,
                            blurRadius: 25,
                          )
                        ],
                      ),
                      child: Text(
                        weatherDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeByString(weatherDescription),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: scrSize.width,
          child: Text(
            temp,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: scrSize.width,
          child: Text(
            "Feels Like $feelsLike°C\n$windStatus",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 25,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: scrSize.width,
          height: scrSize.height * 0.355,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 1,
            ),
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SmallStatCard(text: "Wind Direction\n$windDirection"),
              SmallStatCard(text: "Pressure\n$pressure"),
              SmallStatCard(text: "Humidity\n$humidity%"),
              SmallStatCard(text: "Dew point\n$dewpoint"),
              SmallStatCard(text: "Visibility\n$visibility"),
              SmallStatCard(text: "Speed\n$speed"),
            ],
          ),
        ),
      ],
    );
  }

  double fontSizeByString(String value) {
    if (value.length < 8) {
      return 25;
    } else if (value.length < 10) {
      return 20;
    } else if (value.length < 12) {
      return 18;
    } else {
      return 14;
    }
  }
}
