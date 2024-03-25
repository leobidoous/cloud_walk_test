import 'package:core/core.dart';

import '../../domain/entities/city_entity.dart';
import '../../infra/datasources/i_first_test_datasource.dart';

class FirstTestDatasource implements IFirstTestDatasource {
  FirstTestDatasource({required this.httpDriver});

  final IHttpDriver httpDriver;
  final String _appid = '7b7f405677807f800b43d54594512e3b';

  @override
  Future<Either<HttpDriverResponse, HttpDriverResponse>> fetchCities({
    required String term,
  }) async {
    final cities = [
      CityEntity(
        name: 'Silverstone, Reino Unido',
        lat: 52.0883187,
        lon: -1.0320705,
      ),
      CityEntity(
        name: 'São Paulo, Brasil',
        lat: -23.6820636,
        lon: -46.924957,
      ),
      CityEntity(
        name: 'Melbourne, Austrália',
        lat: -37.970726,
        lon: 144.3937267,
      ),
      CityEntity(
        name: 'Monte Carlo, Mônaco',
        lat: 43.7416941,
        lon: 7.4199838,
      ),
    ];
    await Future.delayed(const Duration(seconds: 1));
    return Right(
      HttpDriverResponse(
        data: term.isEmpty
            ? cities
            : cities
                .where((c) => c.name.toLowerCase().contains(term.toLowerCase()))
                .toList(),
      ),
    );
  }

  @override
  Future<Either<HttpDriverResponse, HttpDriverResponse>> fetchWeatherForecast({
    required int nNextDays,
    required double lat,
    required double lon,
  }) async {
    return httpDriver.get(
      '/data/2.5/forecast',
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'cnt': 50,
        'appid': _appid,
        'lang': 'pt_BR',
      },
    );
  }

  @override
  Future<Either<HttpDriverResponse, HttpDriverResponse>> getWeatherCurrent({
    required double lat,
    required double lon,
  }) {
    return httpDriver.get(
      '/data/2.5/weather',
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': _appid,
        'lang': 'pt_BR',
      },
    );
  }
}
