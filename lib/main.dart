import 'package:core/core.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/app/presentation/app_widget.dart';
import 'modules/app/presentation/modules/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await Future.wait(<Future<void>>[EasyLocalization.ensureInitialized()]);
  final dit = await getTemporaryDirectory();
  runApp(
    EasyLocalization(
      path: 'translations',
      fallbackLocale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      child: ModularApp(
        module: AppModule(hiveCacheStore: HiveCacheStore(dit.path)),
        child: const AppWidget(),
      ),
    ),
  );
}
