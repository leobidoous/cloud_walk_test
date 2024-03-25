class WeatherEntity {
  WeatherEntity({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
    required this.description,
    required this.dtTxt,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double seaLevel;
  final double grndLevel;
  final double humidity;
  final double tempKf;
  final String description;
  final DateTime dtTxt;
}
