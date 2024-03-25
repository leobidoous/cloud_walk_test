import 'package:core/core.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/dependency_manager.dart';

class HttpModule extends Module {
  HttpModule({required this.appBaseUrl});

  final String appBaseUrl;

  @override
  void exportedBinds(Injector i)  async{

    /// Dio client
    i.addLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: appBaseUrl,
          sendTimeout: const Duration(milliseconds: 15000),
          connectTimeout: const Duration(milliseconds: 15000),
          receiveTimeout: const Duration(milliseconds: 60000),
        ),
      )..interceptors.addAll([
          if (kDebugMode) CustomDioLogger(),
          DioCacheInterceptor(
            options: CacheOptions(
              store: DM.i.get<HiveCacheStore>(),
              policy: CachePolicy.forceCache,
              priority: CachePriority.high,
              maxStale: const Duration(minutes: 5),
              hitCacheOnErrorExcept: [401, 404],
              keyBuilder: (request) => request.uri.toString(),
              allowPostMethod: false,
            ),
          ),
        ]),
    );

    /// Http app
    i.add<IHttpDriver>(DioClientDriver.new);
  }
}
