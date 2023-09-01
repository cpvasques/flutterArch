import 'package:flutter/widgets.dart';

abstract class AppRouter {
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
  });

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String routeName,
    RoutePredicate routePredicate,
  );
}
