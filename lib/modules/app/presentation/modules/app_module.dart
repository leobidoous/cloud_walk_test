import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../home/home_module.dart';

class AppModule extends Module {
  AppModule({required this.hiveCacheStore});

  final HiveCacheStore hiveCacheStore;

  @override
  void binds(Injector i) {
    i.addInstance(hiveCacheStore);
  }

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: HomeModule());
  }
}
