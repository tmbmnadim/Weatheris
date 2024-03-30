import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String cod;
  final int message;
  final int cnt;
  final List<DataE> list;
  final CityE city;

  const WeatherEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
}

class CityE extends Equatable {
  final int id;
  final String name;
  final CoordE coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  const CityE({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];
}

class CoordE extends Equatable {
  final double lat;
  final double lon;

  const CoordE({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];
}

class DataE extends Equatable {
  final int dt;
  final MainE main;
  final List<WeatherE> weather;
  final CloudsE clouds;
  final WindE wind;
  final int visibility;
  final double pop;
  final RainE? rain;
  final SysE sys;
  final DateTime dtTxt;

  const DataE({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    this.rain,
    required this.sys,
    required this.dtTxt,
  });

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        rain,
        sys,
        dtTxt,
      ];
}

class CloudsE extends Equatable {
  final int all;

  const CloudsE({
    required this.all,
  });

  @override
  List<Object?> get props => [all];
}

class MainE extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  const MainE({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
        tempKf,
      ];
}

class RainE extends Equatable {
  final double the3H;

  const RainE({
    required this.the3H,
  });

  @override
  List<Object?> get props => [the3H];
}

class SysE extends Equatable {
  final String pod;

  const SysE({
    required this.pod,
  });

  @override
  List<Object?> get props => [pod];
}

class WeatherE extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherE({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}

class WindE extends Equatable {
  final double speed;
  final int deg;
  final double gust;

  const WindE({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];
}
