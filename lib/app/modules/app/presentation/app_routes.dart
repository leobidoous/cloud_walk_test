import 'package:core/core.dart';


class AppRoutes {
  static const BasePath root = BasePath('/');
  static const BasePath firstTest = BasePath('/first_test/', root);
  static const BasePath firstTestDetails = BasePath('/first_test_details/', firstTest);
  
}
