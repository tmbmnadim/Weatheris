import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatheris/features/weather/presentation/widgets/small_card.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size scrSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mar 15, 08:21pm"),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, kToolbarHeight * 1.5, 10, 5),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: scrSize.width),
              SizedBox(
                width: scrSize.width,
                child: const Center(
                  child: Text(
                    "Dhaka, BD",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(
                width: scrSize.width,
                child: const Center(
                  child: Text(
                    "Haze",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: scrSize.width,
                child: const Text(
                  "28°C",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: scrSize.width,
                child: const Text(
                  "Feels like 29°C.\nLight breeze",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: scrSize.width,
                height: scrSize.height * 0.23,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1,
                  ),
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    SmallStatCard(text: "Wind Direction\n2.1m/s ESE"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
