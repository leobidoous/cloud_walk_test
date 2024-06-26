import 'package:core/core.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// [INavigationArgumentsDriver] implementation using [Modular] package
class ModularNavigationArgumentsDriver implements INavigationArgumentsDriver {
  @override
  dynamic get data => Modular.args.data;

  @override
  Map<String, dynamic> get params => Modular.args.params;

  @override
  Map<String, String> get queryParams => Modular.args.queryParams;

  @override
  Map<String, List<String>> get queryParamsAll => Modular.args.queryParamsAll;

  @override
  Uri get uri => Modular.args.uri;
}
