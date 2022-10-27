import 'package:interpolation/interpolation.dart';

/// This class provides the routes used by the application.
///
class Routes {
  Routes._();

  final Interpolation interpolation = Interpolation();

  // Add your routes below
  static const String listProductsScreen = '/listProductsScreen';
  static const String detailProductScreen = '/detailProductScreen';

  // Utility method used to build a dynamic route with params.
  // Example: Routes.buildRouteWithParams('/users/{id}, {'id': 1}); would generate '/users/1'
  String buildRouteWithParams(
      final String route, final Map<String, dynamic> params) {
    return interpolation.eval(route, params);
  }
}
