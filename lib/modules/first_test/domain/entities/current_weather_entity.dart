class CurrentWeatherEntity {
  CurrentWeatherEntity({
    required this.description,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.clouds,
    required this.sunrise,
    required this.sunset,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.feelsLike,
    required this.humidity,
    required this.temp,
  });

  final double visibility;
  final double windSpeed;
  final double windDeg;
  final double clouds;
  final DateTime sunrise;
  final DateTime sunset;
  final double tempMin;
  final double feelsLike;
  final double tempMax;
  final double pressure;
  final double humidity;
  final double temp;
  final String description;
}
