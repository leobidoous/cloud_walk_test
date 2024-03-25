import 'package:cloud_walk_test/modules/first_test/domain/usecases/i_first_test_usecase.dart';
import 'package:cloud_walk_test/modules/first_test/infra/models/current_weather_model.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirstTestUsecase extends Mock implements IFirstTestUsecase {}

void main() {
  late MockFirstTestUsecase usecase;
  setUp(() {
    usecase = MockFirstTestUsecase();
  });

  group('IFirstTestUsecase Test', () {
    test('fetchCities', () async {
      when(usecase.fetchCities(term: '')).thenAnswer((_) async => Right([]));
      final result = await usecase.fetchCities(term: '');
      expect(result.isRight, true);
    });

    test('fetchWeatherForecast', () async {
      when(
        usecase.fetchWeatherForecast(nNextDays: 39, lat: 0.0, lon: 0.0),
      ).thenAnswer(
        (_) async => Right([]),
      );
      var result = await usecase.fetchWeatherForecast(
        nNextDays: 5,
        lat: 0.0,
        lon: 0.0,
      );
      expect(result.isRight, true);
    });

    test('getWeatherCurrent', () async {
      when(
        usecase.getWeatherCurrent(lat: 0, lon: 0),
      ).thenAnswer(
        (_) async => Right(CurrentWeatherModel.fromMap({})),
      );
      var result = await usecase.getWeatherCurrent(lat: 0.0, lon: 0.0);
      expect(result.isRight, true);
    });
  });
}
