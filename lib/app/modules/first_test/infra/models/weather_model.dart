import 'package:core/core.dart';

import '../../domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.seaLevel,
    required super.grndLevel,
    required super.humidity,
    required super.tempKf,
    required super.description,
    required super.dtTxt,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temp: double.tryParse(map['temp'].toString()) ?? 0,
      feelsLike: double.tryParse(map['feelsLike'.toString()]) ?? 0,
      tempMin: double.tryParse(map['tempMin'.toString()]) ?? 0,
      tempMax: double.tryParse(map['tempMax'.toString()]) ?? 0,
      pressure: double.tryParse(map['pressure'.toString()]) ?? 0,
      seaLevel: double.tryParse(map['seaLevel'.toString()]) ?? 0,
      grndLevel: double.tryParse(map['grndLevel'.toString()]) ?? 0,
      humidity: double.tryParse(map['humidity'.toString()]) ?? 0,
      tempKf: double.tryParse(map['tempKf'.toString()]) ?? 0,
      description: map['description'] ?? '',
      dtTxt: DateFormat.tryParseOrDateNow(
        map['dtTxt'],
        pattern: 'yyyy-MM-dd HH:mm:ss',
      ),
    );
  }
}
