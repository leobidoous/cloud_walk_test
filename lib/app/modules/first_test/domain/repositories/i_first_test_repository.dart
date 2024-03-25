import 'package:core/core.dart';

import '../entities/city_entity.dart';
import '../entities/weather_entity.dart';

abstract class IFirstTestRepository {
  Future<Either<ICustomFailure, List<CityEntity>>> fetchCities({
    required String term,
  });
  Future<Either<ICustomFailure, List<WeatherEntity>>> fetchWeatherForecast({
    required int nNextDays,
    required double lat,
    required double lon,
  });
  Future<Either<ICustomFailure, WeatherEntity>> getWeatherCurrent({
    required double lat,
    required double lon,
  });
}
