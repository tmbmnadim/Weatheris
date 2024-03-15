import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final CoordE? coord;
  final List<WeatherE>? weather;
  final String? base;
  final MainE? main;
  final int? visibility;
  final WindE? wind;
  final CloudsE? clouds;
  final int? dt;
  final SysE? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const WeatherEntity({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  List<Object?> get props => [
        coord,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];
}

class CoordE extends Equatable {
  final double? lon;
  final double? lat;

  const CoordE({this.lon, this.lat});

  @override
  List<Object?> get props => [lon, lat];
}

class WeatherE extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherE({this.id, this.main, this.description, this.icon});

  @override
  List<Object?> get props => [id, main, description, icon];
}

class MainE extends Equatable {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  const MainE({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];
}

class WindE extends Equatable {
  final double? speed;
  final int? deg;

  const WindE({this.speed, this.deg});

  @override
  List<Object?> get props => [speed, deg];
}

class CloudsE extends Equatable {
  final int? all;

  const CloudsE({this.all});

  @override
  List<Object?> get props => [all];
}

class SysE extends Equatable {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  const SysE({this.type, this.id, this.country, this.sunrise, this.sunset});

  @override
  List<Object?> get props => [
        type,
        id,
        country,
        sunrise,
        sunset,
      ];
}
