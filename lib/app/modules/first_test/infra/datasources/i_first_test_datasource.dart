import 'package:core/core.dart';

abstract class IFirstTestDatasource {
  Future<Either<HttpDriverResponse, HttpDriverResponse>> fetchCities({
    required String term,
  });
  Future<Either<HttpDriverResponse, HttpDriverResponse>> fetchWeather({
    required int nNextDays,
  });
}
