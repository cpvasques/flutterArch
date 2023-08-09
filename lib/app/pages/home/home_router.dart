import 'package:app_flutter_arch/app/pages/home/home_controller.dart';
import 'package:app_flutter_arch/app/pages/home/home_page.dart';
import 'package:app_flutter_arch/app/repositories/repositoryExample/repository_example.dart';
import 'package:app_flutter_arch/app/repositories/repositoryExample/repository_example_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<RepositoryExample>(
            create: (context) => RepositoryExampleImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => HomeController(
              context.read(),
            ),
          ),
        ],
        child: const HomePage(),
      );
}
