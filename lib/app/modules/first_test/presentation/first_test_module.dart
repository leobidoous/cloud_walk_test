import 'package:flutter_modular/flutter_modular.dart';

import '../../app/presentation/modules/http_module.dart';
import '../data/datasources/first_test_datasource.dart';
import '../domain/repositories/i_first_test_repository.dart';
import '../domain/usecases/i_first_test_usecase.dart';
import '../infra/datasources/i_first_test_datasource.dart';
import '../infra/repositories/first_test_repository.dart';
import '../infra/usecases/first_test_usecase.dart';
import 'controllers/cities_controller.dart';
import 'first_test_page.dart';

class FirstTestModule extends Module {
  @override
  List<Module> get imports => [HttpModule(appBaseUrl: '')];
  @override
  void binds(Injector i) {
    i.add<IFirstTestDatasource>(FirstTestDatasource.new);
    i.add<IFirstTestRepository>(FirstTestRepository.new);
    i.add<IFirstTestUsecase>(FirstTestUsecase.new);
    i.add<CitiesController>(CitiesController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const FirstTestPage());
  }
}
