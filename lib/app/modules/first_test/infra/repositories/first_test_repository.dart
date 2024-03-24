import 'package:core/core.dart' show Either;
import 'package:core/src/domain/failures/i_custom_failure.dart';

import '../../domain/entities/city_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/i_first_test_repository.dart';
import '../datasources/i_first_test_datasource.dart';

class FirstTestRepository implements IFirstTestRepository {
  FirstTestRepository({required this.datasource});

  final IFirstTestDatasource datasource;

  @override
  Future<Either<ICustomFailure, List<CityEntity>>> fetchCities({
    required String term,
  }) {
    // TODO: implement fetchCities
    throw UnimplementedError();
  }

  @override
  Future<Either<ICustomFailure, List<WeatherEntity>>> fetchWeather({
    required int nNextDays,
  }) {
    // TODO: implement fetchWeather
    throw UnimplementedError();
  }
}
