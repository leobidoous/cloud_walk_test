import 'package:core/core.dart';

import '../entities/city_entity.dart';
import '../entities/weather_entity.dart';

abstract class IFirstTestRepository {
  Future<Either<ICustomFailure, List<CityEntity>>> fetchCities({
    required String term,
  });
  Future<Either<ICustomFailure, List<WeatherEntity>>> fetchWeather({
    required int nNextDays,
  });
}
