import 'package:core/core.dart';

import '../entities/city_entity.dart';
import '../entities/weather_entity.dart';

abstract class IFirstTestUsecase {
  Future<Either<ICustomFailure, List<CityEntity>>> fetchCities({
    required String term,
  });
  Future<Either<ICustomFailure, List<WeatherEntity>>> fetchWeather({
    int nNextDays,
  });
}
