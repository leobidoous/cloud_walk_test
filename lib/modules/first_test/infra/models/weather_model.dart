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
    required super.dtTxt,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temp: double.tryParse(map['main']?['temp'].toString() ?? '') ?? 0,
      feelsLike:
          double.tryParse(map['main']?['feelsLike'].toString() ?? '') ?? 0,
      tempMin: double.tryParse(map['main']?['tempMin'].toString() ?? '') ?? 0,
      tempMax: double.tryParse(map['main']?['tempMax'].toString() ?? '') ?? 0,
      pressure: double.tryParse(map['main']?['pressure'].toString() ?? '') ?? 0,
      seaLevel: double.tryParse(map['main']?['seaLevel'].toString() ?? '') ?? 0,
      grndLevel:
          double.tryParse(map['main']?['grndLevel'].toString() ?? '') ?? 0,
      humidity: double.tryParse(map['main']?['humidity'].toString() ?? '') ?? 0,
      tempKf: double.tryParse(map['main']?['tempKf'].toString() ?? '') ?? 0,
      dtTxt: DateFormat.tryParseOrDateNow(
        map['dt_txt'],
        pattern: 'yyyy-MM-dd HH:mm:ss',
      ),
    );
  }
}
