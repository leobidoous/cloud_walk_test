import 'dart:async';

import 'package:core/core.dart';

import '../../domain/entities/weather_entity.dart';
import '../../domain/usecases/i_first_test_usecase.dart';

class WeathersController
    extends CustomController<ICustomFailure, List<WeatherEntity>> {
  WeathersController({required this.usecase}) : super(const []);

  final IFirstTestUsecase usecase;

  List<DateTime> get days {
    final days = List<DateTime>.empty(growable: true);
    for (WeatherEntity weather in state) {
      final date = DateTime(
        weather.dtTxt.year,
        weather.dtTxt.month,
        weather.dtTxt.day,
      );
      if (!days.contains(date)) days.add(date);
    }
    return days;
  }

  List<WeatherEntity> getWeathersByDate(DateTime date) {
    return state.where((w) => DateFormat.isSameDate(w.dtTxt, date)).toList();
  }

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
}
