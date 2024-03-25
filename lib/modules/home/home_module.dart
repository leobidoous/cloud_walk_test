import 'package:flutter_modular/flutter_modular.dart';

import '../app/presentation/app_routes.dart';
import '../first_test/presentation/first_test_module.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
    r.module(AppRoutes.firstTest.path, module: FirstTestModule());
  }
}
