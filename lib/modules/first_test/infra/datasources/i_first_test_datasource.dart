import 'package:core/core.dart';

abstract class IFirstTestDatasource {
  Future<Either<HttpDriverResponse, HttpDriverResponse>> fetchCities({
    required String term,
  });
  Future<Either<HttpDriverResponse, HttpDriverResponse>> fetchWeatherForecast({
    required int nNextDays,
    required double lat,
    required double lon,
  });
  Future<Either<HttpDriverResponse, HttpDriverResponse>> getWeatherCurrent({
    required double lat,
    required double lon,
  });
}
