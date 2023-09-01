import 'package:app_flutter_arch/app/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AppRouterBuildContextExtension on BuildContext {
  AppRouter get appRouter => read<AppRouter>();

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
  }) {
    return appRouter.popAndPushNamed<T, TO>(
      routeName,
      result: result,
    );
  }
}

extension AppRouterStateExtension on State {
  AppRouter get appRouter => context.appRouter;

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
  }) {
    return context.popAndPushNamed(
      routeName,
      result: result,
    );
  }
}
