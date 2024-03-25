import 'dart:async';

import 'package:core/core.dart';

import '../../domain/entities/weather_entity.dart';
import '../../domain/usecases/i_first_test_usecase.dart';

class WeathersController
    extends CustomController<ICustomFailure, List<WeatherEntity>> {
  WeathersController({required this.usecase}) : super(const []);

  final IFirstTestUsecase usecase;

  WeatherEntity? weatherCurrent;

  Future<void> fetchWeatherForecast({
    int nNextDays = 5,
    required double lat,
    required double lon,
  }) async {
    await execute(
      () => usecase.fetchWeatherForecast(
        nNextDays: nNextDays,
        lat: lat,
        lon: lon,
      ),
    );
  }

  Future<void> getWeatherCurrent({
    required double lat,
    required double lon,
  }) async {
    await execute(
      () => usecase.getWeatherCurrent(lat: lat, lon: lon).then((value) {
        return value.fold(Left, (r) {
          weatherCurrent = r;
          return Right(state);
        });
      }),
    );
  }
}
