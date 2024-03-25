import 'package:core/core.dart';

import '../entities/city_entity.dart';
import '../entities/current_weather_entity.dart';
import '../entities/weather_entity.dart';

abstract class IFirstTestUsecase {
  Future<Either<ICustomFailure, List<CityEntity>>> fetchCities({
    required String term,
  });
  Future<Either<ICustomFailure, List<WeatherEntity>>> fetchWeatherForecast({
    int nNextDays,
    required double lat,
    required double lon,
  });
  Future<Either<ICustomFailure, CurrentWeatherEntity>> getWeatherCurrent({
    required double lat,
    required double lon,
  });
}
