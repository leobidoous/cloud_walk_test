import 'package:core/core.dart';

import '../../domain/entities/city_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/i_first_test_repository.dart';
import '../../domain/usecases/i_first_test_usecase.dart';

class FirstTestUsecase implements IFirstTestUsecase {
  FirstTestUsecase({required this.repository});

  final IFirstTestRepository repository;
  
  @override
  Future<Either<ICustomFailure, List<CityEntity>>> fetchCities({
    required String term,
  }) {
    return repository.fetchCities(term: term);
  }

  @override
  Future<Either<ICustomFailure, List<WeatherEntity>>> fetchWeather({
    int nNextDays = 5,
  }) {
    return repository.fetchWeather(nNextDays: nNextDays);
  }
}
