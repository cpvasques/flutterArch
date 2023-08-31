import 'package:app_flutter_arch/app/core/rest_client/custom_dio.dart';
import 'package:app_flutter_arch/app/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final AppRouter appRouter;
  final Widget child;

  const ApplicationBinding({
    super.key,
    required this.child,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider(
          create: (context) => appRouter,
        ),
      ],
      child: child,
    );
  }
}
