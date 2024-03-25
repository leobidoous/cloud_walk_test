import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CloudWalk',
      locale: context.locale,
      routerDelegate: Modular.routerDelegate,
      builder: (_, child) {
        return MediaQuery(
          data: MediaQuery.of(_).copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: GestureDetector(
            onTap: () => SystemChannels.textInput.invokeMethod(
              'TextInput.hide',
            ),
            child: child ?? const SizedBox(),
          ),
        );
      },
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
