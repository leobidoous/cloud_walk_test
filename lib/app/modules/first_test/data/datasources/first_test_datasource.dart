import 'package:core/core.dart';

import '../../infra/datasources/i_first_test_datasource.dart';

class FirstTestDatasource implements IFirstTestDatasource {
  FirstTestDatasource({required this.httpDriver});

  final IHttpDriver httpDriver;

  @override
  Future<Either<HttpDriverResponse, HttpDriverResponse>> fetchCities({
    required String term,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<HttpDriverResponse, HttpDriverResponse>> fetchWeather({
    required int nNextDays,
  }) {
    throw UnimplementedError();
  }
}
