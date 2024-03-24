
import 'custom_failures.dart';

abstract class IAppFailure extends ICustomFailure {
  IAppFailure(super.message);
}

class AppServerError extends IAppFailure {
  AppServerError(super.message);
}

class AppUnknownError extends IAppFailure {
  AppUnknownError(super.message);
}
