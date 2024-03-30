import 'package:weatheris/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.cod,
    required super.message,
    required super.cnt,
    required super.list,
    required super.city,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cod: json["cod"],
      message: json["message"],
      cnt: json["cnt"],
      list: List<Data>.from(json["list"].map((x) => Data.fromJson(x))),
      city: City.fromJson(json["city"]),
    );
  }

  factory WeatherModel.fromEntity(WeatherEntity weatherEntity) {
    return WeatherModel(
      cod: weatherEntity.cod,
      message: weatherEntity.message,
      cnt: weatherEntity.cnt,
      list: weatherEntity.list,
      city: weatherEntity.city,
    );
  }
}

class City extends CityE {
  const City({
    required super.id,
    required super.name,
    required super.coord,
    required super.country,
    required super.population,
    required super.timezone,
    required super.sunrise,
    required super.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"],
      name: json["name"],
      coord: Coord.fromJson(json["coord"]),
      country: json["country"],
      population: json["population"],
      timezone: json["timezone"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }

  factory City.fromEntity(CityE cityE) {
    return City(
      id: cityE.id,
      name: cityE.name,
      coord: cityE.coord,
      country: cityE.country,
      population: cityE.population,
      timezone: cityE.timezone,
      sunrise: cityE.sunrise,
      sunset: cityE.sunset,
    );
  }
}

class Coord extends CoordE {
  const Coord({
    required super.lat,
    required super.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json["lat"]?.toDouble(),
      lon: json["lon"]?.toDouble(),
    );
  }

  factory Coord.fromEntity(CoordE coordE) {
    return Coord(
      lon: coordE.lon,
      lat: coordE.lat,
    );
  }
}

class Data extends DataE {
  Data({
    required super.dt,
    required super.main,
    required super.weather,
    required super.clouds,
    required super.wind,
    required super.visibility,
    required super.pop,
    required super.sys,
    required super.dtTxt,
    super.rain,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      dt: json["dt"],
      main: Main.fromJson(json["main"]),
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      clouds: Clouds.fromJson(json["clouds"]),
      wind: Wind.fromJson(json["wind"]),
      visibility: json["visibility"],
      pop: json["pop"]?.toDouble(),
      rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      sys: Sys.fromJson(json["sys"]),
      dtTxt: DateTime.parse(json["dt_txt"]),
    );
  }

  factory Data.fromEntity(DataE dataE) {
    return Data(
      dt: dataE.dt,
      main: dataE.main,
      weather: dataE.weather,
      clouds: dataE.clouds,
      wind: dataE.wind,
      visibility: dataE.visibility,
      pop: dataE.pop,
      sys: dataE.sys,
      dtTxt: dataE.dtTxt,
    );
  }
}

class Clouds extends CloudsE {
  const Clouds({
    required super.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json["all"],
    );
  }

  factory Clouds.fromEntity(CloudsE cloudsE) {
    return Clouds(all: cloudsE.all);
  }
}

class Main extends MainE {
  const Main({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.seaLevel,
    required super.grndLevel,
    required super.humidity,
    required super.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json["temp"]?.toDouble(),
      feelsLike: json["feels_like"]?.toDouble(),
      tempMin: json["temp_min"]?.toDouble(),
      tempMax: json["temp_max"]?.toDouble(),
      pressure: json["pressure"],
      seaLevel: json["sea_level"],
      grndLevel: json["grnd_level"],
      humidity: json["humidity"],
      tempKf: json["temp_kf"]?.toDouble(),
    );
  }

  factory Main.fromEntity(MainE mainE) {
    return Main(
      temp: mainE.temp,
      feelsLike: mainE.feelsLike,
      tempMin: mainE.tempMin,
      tempMax: mainE.tempMax,
      pressure: mainE.pressure,
      seaLevel: mainE.seaLevel,
      grndLevel: mainE.grndLevel,
      humidity: mainE.humidity,
      tempKf: mainE.tempKf,
    );
  }
}

class Rain extends RainE {
  const Rain({
    required super.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      the3H: json["3h"]?.toDouble(),
    );
  }

  factory Rain.fromEntity(RainE rainE) {
    return Rain(the3H: rainE.the3H);
  }
}

class Sys extends SysE {
  const Sys({
    required super.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json["pod"],
    );
  }

  factory Sys.fromEntity(SysE sysE) {
    return Sys(pod: sysE.pod);
  }
}

class Weather extends WeatherE {
  const Weather({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json["id"],
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
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

class Wind extends WindE {
  const Wind({
    required super.speed,
    required super.deg,
    required super.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json["speed"]?.toDouble(),
      deg: json["deg"],
      gust: json["gust"]?.toDouble(),
    );
  }

  factory Wind.fromEntity(WindE windE) {
    return Wind(
      speed: windE.speed,
      deg: windE.deg,
      gust: windE.gust,
    );
  }
}
