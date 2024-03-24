import 'package:core/core.dart';
import 'package:flutter_modular/flutter_modular.dart';

///
/// Dependency manager implementation with Modular package
///
class ModularDependencyManagerDriver implements IDependencyManagerDriver {
  ModularDependencyManagerDriver._();

  static ModularDependencyManagerDriver? _instance;

  ///
  /// Static instance for DM
  ///
  static ModularDependencyManagerDriver i() {
    _instance ??= ModularDependencyManagerDriver._();

    return _instance!;
  }

  @override
  T get<T extends Object>({String? key}) {
    return Modular.get<T>(key: key);
  }

  @override
  bool dispose<T extends Object>({String? key}) {
    return Modular.dispose<T>(key: key);
  }
}
