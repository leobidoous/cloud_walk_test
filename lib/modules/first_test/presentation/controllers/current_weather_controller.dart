import 'dart:async';

import 'package:core/core.dart';

import '../../domain/entities/current_weather_entity.dart';
import '../../domain/usecases/i_first_test_usecase.dart';
import '../../infra/models/current_weather_model.dart';

class CurrentWeatherController
    extends CustomController<ICustomFailure, CurrentWeatherEntity> {
  CurrentWeatherController({required this.usecase})
      : super(CurrentWeatherModel.fromMap({}));

  final IFirstTestUsecase usecase;
  Future<void> getWeatherCurrent({
    required double lat,
    required double lon,
  }) async {
    await execute(() => usecase.getWeatherCurrent(lat: lat, lon: lon));
  }
}
