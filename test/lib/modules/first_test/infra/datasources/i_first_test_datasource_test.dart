import 'package:cloud_walk_test/modules/first_test/infra/datasources/i_first_test_datasource.dart';
import 'package:cloud_walk_test/modules/first_test/infra/models/current_weather_model.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirstTestDatasource extends Mock implements IFirstTestDatasource {}

void main() {
  late MockFirstTestDatasource datasource;
  setUp(() {
    datasource = MockFirstTestDatasource();
  });

  group('IFirstTestDatasource Test', () {
    test('fetchCities', () async {
      when(datasource.fetchCities(term: ''))
          .thenAnswer((_) async => Right(HttpDriverResponse(data: [])));
      var result = await datasource.fetchCities(term: '');
      expect(result.isRight, true);
    });

    test('fetchWeatherForecast', () async {
      when(
        datasource.fetchWeatherForecast(nNextDays: 39, lat: 0.0, lon: 0.0),
      ).thenAnswer(
        (_) async => Right(HttpDriverResponse(data: [])),
      );
      var result = await datasource.fetchWeatherForecast(
        nNextDays: 5,
        lat: 0.0,
        lon: 0.0,
      );
      expect(result.isRight, true);
    });

    test('getWeatherCurrent', () async {
      when(
        datasource.getWeatherCurrent(lat: 0, lon: 0),
      ).thenAnswer(
        (_) async =>
            Right(HttpDriverResponse(data: CurrentWeatherModel.fromMap({}))),
      );
      var result = await datasource.getWeatherCurrent(lat: 0.0, lon: 0.0);
      expect(result.isRight, true);
    });
  });
}
