import 'package:cloud_walk_test/modules/first_test/domain/repositories/i_first_test_repository.dart';
import 'package:cloud_walk_test/modules/first_test/infra/models/current_weather_model.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirstTestRepository extends Mock implements IFirstTestRepository {}

void main() {
  late MockFirstTestRepository repository;
  setUp(() {
    repository = MockFirstTestRepository();
  });

  group('IFirstTestRepository Test', () {
    test('fetchCities', () async {
      when(repository.fetchCities(term: '')).thenAnswer((_) async => Right([]));
      var result = await repository.fetchCities(term: '');
      expect(result.isRight, true);
    });

    test('fetchWeatherForecast', () async {
      when(
        repository.fetchWeatherForecast(nNextDays: 39, lat: 0.0, lon: 0.0),
      ).thenAnswer(
        (_) async => Right([]),
      );
      var result = await repository.fetchWeatherForecast(
        nNextDays: 5,
        lat: 0.0,
        lon: 0.0,
      );
      expect(result.isRight, true);
    });

    test('getWeatherCurrent', () async {
      when(
        repository.getWeatherCurrent(lat: 0, lon: 0),
      ).thenAnswer(
        (_) async => Right(CurrentWeatherModel.fromMap({})),
      );
      var result = await repository.getWeatherCurrent(lat: 0.0, lon: 0.0);
      expect(result.isRight, true);
    });
  });
}
