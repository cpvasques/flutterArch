import 'package:app_flutter_arch/app/core/router/app_router.dart';
import 'package:flutter/widgets.dart';

class NavigatorAppRouter implements AppRouter {
  final GlobalKey<NavigatorState> navigatorStateKey;

  NavigatorAppRouter({
    required this.navigatorStateKey,
  });

  NavigatorState? get navigatorState => navigatorStateKey.currentState;

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
  }) async {
    return navigatorState?.popAndPushNamed<T, TO>(
      routeName,
      result: result,
    );
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String routeName,
    RoutePredicate routePredicate,
  ) async {
    return navigatorState?.pushNamedAndRemoveUntil<T>(
      routeName,
      routePredicate,
    );
  }
}
