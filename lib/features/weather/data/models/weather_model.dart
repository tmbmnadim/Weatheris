import 'package:weatheris/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    super.coord,
    super.weather,
    super.base,
    super.main,
    super.visibility,
    super.wind,
    super.clouds,
    super.dt,
    super.sys,
    super.timezone,
    super.id,
    super.name,
    super.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    List<Weather> tempWeather = [];
    Main? tempMain = json['main'] != null ? Main.fromJson(json['main']) : null;
    Wind? tempWind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    Clouds? tempCloud =
        json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    Sys? sysTemp = json['sys'] != null ? Sys.fromJson(json['sys']) : null;

    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        tempWeather.add(Weather.fromJson(v));
      });
    }
    return WeatherModel(
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      weather: tempWeather,
      base: json['base'],
      main: tempMain,
      visibility: json['visibility'],
      wind: tempWind,
      clouds: tempCloud,
      dt: json['dt'],
      sys: sysTemp,
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  factory WeatherModel.fromEntity(WeatherEntity weatherEntity) {
    return WeatherModel(
      coord: weatherEntity.coord,
      weather: weatherEntity.weather,
      base: weatherEntity.base,
      main: weatherEntity.main,
      visibility: weatherEntity.visibility,
      wind: weatherEntity.wind,
      clouds: weatherEntity.clouds,
      dt: weatherEntity.dt,
      sys: weatherEntity.sys,
      timezone: weatherEntity.timezone,
      id: weatherEntity.id,
      name: weatherEntity.name,
      cod: weatherEntity.cod,
    );
  }
}

class Coord extends CoordE {
  const Coord({super.lon, super.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'],
      lat: json['lat'],
    );
  }

  factory Coord.fromEntity(CoordE coord) {
    return Coord(
      lon: coord.lon,
      lat: coord.lat,
    );
  }
}

class Weather extends WeatherE {
  const Weather({super.id, super.main, super.description, super.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  factory Weather.fromEntity(WeatherE weatherE) {
    return Weather(
      id: weatherE.id,
      main: weatherE.main,
      description: weatherE.description,
      icon: weatherE.icon,
    );
  }
}

class Main extends MainE {
  const Main({
    super.temp,
    super.feelsLike,
    super.tempMin,
    super.tempMax,
    super.pressure,
    super.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feelsLike'],
      tempMin: json['tempMin'],
      tempMax: json['tempMax'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }

  factory Main.fromEntity(MainE mainE) {
    return Main(
      temp: mainE.temp,
      feelsLike: mainE.feelsLike,
      tempMin: mainE.tempMin,
      tempMax: mainE.tempMax,
      pressure: mainE.pressure,
      humidity: mainE.humidity,
    );
  }
}

class Wind extends WindE {
  const Wind({super.speed, super.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
    );
  }
  factory Wind.fromEntity(WindE windE) {
    return Wind(
      speed: windE.speed,
      deg: windE.deg,
    );
  }
}

class Clouds extends CloudsE {
  const Clouds({super.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Sys extends SysE {
  const Sys({super.type, super.id, super.country, super.sunrise, super.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  factory Sys.fromEntity(SysE sysE) {
    return Sys(
      type: sysE.type,
      id: sysE.id,
      country: sysE.country,
      sunrise: sysE.sunrise,
      sunset: sysE.sunset,
    );
  }
}
