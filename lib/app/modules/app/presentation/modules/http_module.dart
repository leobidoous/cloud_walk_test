import 'package:core/core.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HttpModule extends Module {
  HttpModule({required this.appBaseUrl});

  final String appBaseUrl;

  @override
  void exportedBinds(Injector i) {
    /// Dio client
    i.addLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: appBaseUrl,
          sendTimeout: const Duration(milliseconds: 15000),
          connectTimeout: const Duration(milliseconds: 15000),
          receiveTimeout: const Duration(milliseconds: 60000),
        ),
      )..interceptors.addAll([CustomDioLogger()]),
    );

    /// Http app
    i.add<IHttpDriver>(DioClientDriver.new);
  }
}
