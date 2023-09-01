import 'package:app_flutter_arch/app/core/ui/widgets/app_bar_example.dart';
import 'package:app_flutter_arch/app/pages/home/home_controller.dart';
import 'package:app_flutter_arch/app/pages/home/home_state.dart';
import 'package:app_flutter_arch/app/pages/home/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePage<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarExample(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showFailureError(state.failure);
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return const HomeBody();
        },
      ),
    );
  }
}
