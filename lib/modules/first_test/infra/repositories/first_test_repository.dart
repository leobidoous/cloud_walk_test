import 'package:core/core.dart';

import '../../../app/domain/failures/i_app_failures.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/entities/current_weather_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/i_first_test_repository.dart';
import '../datasources/i_first_test_datasource.dart';
import '../models/current_weather_model.dart';
import '../models/weather_model.dart';

class FirstTestRepository implements IFirstTestRepository {
  FirstTestRepository({required this.datasource});

  final IFirstTestDatasource datasource;

  @override
  Future<Either<ICustomFailure, List<CityEntity>>> fetchCities({
    required String term,
  }) {
    return datasource.fetchCities(term: term).then((value) {
      return value.fold(
        (l) => Left(AppServerError(message: l.data)),
        (r) => Right(r.data),
      );
    });
  }

  @override
  Future<Either<ICustomFailure, List<WeatherEntity>>> fetchWeatherForecast({
    required int nNextDays,
    required double lat,
    required double lon,
  }) {
    return datasource
        .fetchWeatherForecast(nNextDays: nNextDays, lat: lat, lon: lon)
        .then((value) {
      return value.fold(
        (l) => Left(AppServerError(message: l.data['message'])),
        (r) {
          try {
            return Right(
              (r.data['list'] as List)
                  .map((e) => WeatherModel.fromMap(e))
                  .toList(),
            );
          } catch (e) {
            return Left(AppUnknownError(message: '$e'));
          }
        },
      );
    });
  }

  @override
  Future<Either<ICustomFailure, CurrentWeatherEntity>> getWeatherCurrent({
    required double lat,
    required double lon,
  }) {
    return datasource.getWeatherCurrent(lat: lat, lon: lon).then((value) {
      return value.fold(
        (l) => Left(AppServerError(message: l.data['message'])),
        (r) {
          try {
            return Right(CurrentWeatherModel.fromMap(r.data));
          } catch (e) {
            return Left(AppUnknownError(message: '$e'));
          }
        },
      );
    });
  }
}
