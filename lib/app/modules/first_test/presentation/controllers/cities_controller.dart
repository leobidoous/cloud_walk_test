import 'dart:async';

import 'package:core/core.dart';

import '../../domain/entities/city_entity.dart';
import '../../domain/usecases/i_first_test_usecase.dart';

class CitiesController extends CustomController<Exception, List<CityEntity>> {
  CitiesController({required this.usecase}) : super(const []);

  Timer? _debounce;
  final IFirstTestUsecase usecase;

  Future<void> fetchSponsors([String term = '']) async {
    await execute(() => usecase.fetchCities(term: term));
  }

  void onSearchChanged(Function() callback) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      callback();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
