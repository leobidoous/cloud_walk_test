import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modular_navigation_arguments_driver.dart';

///
/// Navigation implementation using Modular package
///
class ModularNavigationDriver implements INavigationDriver {
  ModularNavigationDriver._();
  final ModularNavigationArgumentsDriver _args =
      ModularNavigationArgumentsDriver();

  static ModularNavigationDriver? _instance;

  ///
  /// Static instance for DM
  ///
  static ModularNavigationDriver i() {
    _instance ??= ModularNavigationDriver._();
    return _instance!;
  }

  @override
  BasePath get path => BasePath(Modular.to.path);

  @override
  INavigationArgumentsDriver get args => _args;

  @override
  bool canPop() {
    return Modular.to.canPop();
  }

  @override
  BuildContext? get context {
    return Modular.routerDelegate.navigatorKey.currentContext;
  }

  @override
  void pop<T extends Object?>({
    T? response,
    BuildContext? context,
  }) {
    if (context != null || context != null) {
      return Navigator.of(context).pop(response);
    }
    Modular.to.pop(response);
  }

  @override
  Future<T?> pushNamed<T extends Object?>(
    Object path, {
    Object? arguments,
    bool forRoot = true,
  }) async {
    return Modular.to.pushNamed<T?>(
      path.toString(),
      arguments: arguments,
      forRoot: forRoot,
    );
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    Object path,
    bool Function(Route) predicate, {
    Object? arguments,
    bool forRoot = true,
  }) async {
    return Modular.to.pushNamedAndRemoveUntil<T>(
      path.toString(),
      predicate,
      arguments: arguments,
      forRoot: forRoot,
    );
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    Object path, {
    Object? arguments,
    bool forRoot = true,
  }) {
    return Modular.to.pushReplacementNamed(
      path.toString(),
      arguments: arguments,
      forRoot: forRoot,
    );
  }

  @override
  void navigate(Object path, {dynamic arguments}) {
    return Modular.to.navigate(path.toString(), arguments: arguments);
  }

  @override
  void popUntil(Object path) {
    Modular.to.popUntil(ModalRoute.withName(path.toString()));
  }

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) {
    return Modular.to.maybePop(result);
  }

  @override
  List<String> get history =>
      Modular.to.navigateHistory.map((e) => e.name).toList();

  @override
  void addListener(VoidCallback listener) {
    Modular.to.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    Modular.to.removeListener(listener);
  }

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    Object path, {
    TO? result,
    Object? arguments,
    bool forRoot = true,
  }) {
    return Modular.to.popAndPushNamed(
      path.toString(),
      result: result,
      arguments: arguments,
      forRoot: forRoot,
    );
  }

  @override
  Future<T?> push<T extends Object?>(Route<T> route) async {
    return Modular.to.push(route);
  }

  @override
  String get initialRoute => Modular.initialRoute;

  @override
  bool canPopUntil<T extends Object?>(Object path) {
    return RouterObserver().getNavigateHistory.contains(path);
  }

  @override
  @override
  Future<T?> popUntilAndPushNamed<T extends Object?>(
    Object firstPath,
    Object secondpath, {
    Object? arguments,
    bool forRoot = true,
  }) async {
    popUntil(firstPath);
    return pushNamed(secondpath, arguments: arguments, forRoot: forRoot);
  }

  @override
  Future<T?> popAndPushReplacementNamed<T extends Object?, TO extends Object?>(
    Object path, {
    TO? result,
    Object? arguments,
    bool forRoot = false,
  }) async {
    pop(response: result);
    return pushReplacementNamed(path, arguments: arguments, forRoot: forRoot);
  }

  @override
  Future<T?>
      popUntilOrPushReplacementNamed<T extends Object?, TO extends Object?>(
    Object basePath, {
    Object? arguments,
    bool forRoot = true,
  }) async {
    if (canPopUntil(basePath)) {
      popUntil(basePath);
      return null;
    }
    return pushReplacementNamed(
      basePath,
      arguments: arguments,
      forRoot: forRoot,
    );
  }

  @override
  Future<T?> popUntilOrPushNamed<T extends Object?, TO extends Object?>(
    Object path, {
    Object? arguments,
    bool forRoot = true,
  }) async {
    if (canPopUntil(path)) {
      popUntil(path.toString());
      return null;
    }
    return pushReplacementNamed(path, arguments: arguments, forRoot: forRoot);
  }

  @override
  Future<T?> popUntilAndPushReplacementNamed<T extends Object?>(
    Object firstPath,
    Object secondpath, {
    Object? arguments,
    bool forRoot = true,
  }) {
    popUntil(firstPath);
    return pushReplacementNamed(
      secondpath,
      arguments: arguments,
      forRoot: forRoot,
    );
  }
}
