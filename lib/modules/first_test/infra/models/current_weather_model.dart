import 'package:core/core.dart';

import '../../domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  CurrentWeatherModel({
    required super.visibility,
    required super.windSpeed,
    required super.windDeg,
    required super.clouds,
    required super.sunrise,
    required super.sunset,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    required super.description,
    required super.temp,
    required super.feelsLike,
  });

  factory CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherModel(
      visibility: double.tryParse(map['visibility'].toString()) ?? 0,
      windSpeed: double.tryParse(map['wind']?['speed'].toString() ?? '') ?? 0,
      windDeg: double.tryParse(map['wind']?['deg'].toString() ?? '') ?? 0,
      clouds: double.tryParse(map['clouds']?['all'].toString() ?? '') ?? 0,
      sunrise: DateFormat.tryParseOrDateNow(map['sys']?['sunrise'].toString()),
      sunset: DateFormat.tryParseOrDateNow(map['sys']?['sunset'].toString()),
      tempMin: double.tryParse(map['main']?['temp_min'].toString() ?? '') ?? 0,
      tempMax: double.tryParse(map['main']?['temp_max'].toString() ?? '') ?? 0,
      feelsLike:
          double.tryParse(map['main']?['feels_like'].toString() ?? '') ?? 0,
      pressure: double.tryParse(map['main']?['pressure'].toString() ?? '') ?? 0,
      humidity: double.tryParse(map['main']?['humidity'].toString() ?? '') ?? 0,
      description: map['description']?['weather'] ?? '',
      temp: double.tryParse(map['main']?['temp'].toString() ?? '') ?? 0,
    );
  }
}
