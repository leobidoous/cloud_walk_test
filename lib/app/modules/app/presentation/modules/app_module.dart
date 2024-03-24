import 'package:flutter_modular/flutter_modular.dart';

import '../../../home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: HomeModule());
  }
}
