import 'package:flutter_modular/flutter_modular.dart';

import '../app/presentation/app_routes.dart';
import '../first_test/presentation/first_test_module.dart';
import 'counter_cubit.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(CounterCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
    r.module(AppRoutes.firstTest.path, module: FirstTestModule());
  }
}
