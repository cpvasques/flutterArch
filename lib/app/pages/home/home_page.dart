import 'package:app_flutter_arch/app/core/ui/helpers/size_extensions.dart';
import 'package:app_flutter_arch/app/core/ui/widgets/app_bar_example.dart';
import 'package:app_flutter_arch/app/core/ui/widgets/generic_input.dart';
import 'package:app_flutter_arch/app/pages/home/home_controller.dart';
import 'package:app_flutter_arch/app/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late FocusNode userFocusNode = FocusNode();
  late FocusNode passwordFocusNode = FocusNode();

  //se onReady não funcionar, utilize:
  // @override
  // void initState() {
  //   super.initState();
  //   userFocusNode = FocusNode();
  //   passwordFocusNode = FocusNode();
  // }

  @override
  void onReady() {
    controller.loadItems();
  }

  @override
  void dispose() {
    userFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _onLoginButtonPressed() async {
    var credentials = {
      'user': userController.text,
      'password': passwordController.text
    };

    var user = credentials['user'];
    var password = credentials['password'];

    if (user == null || user.isEmpty || password == null || password.isEmpty) {
      return showInfo('Preencha todos os campos.');
    }
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
              showError(state.errorMessage ?? 'Erro não informado');
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    Title(
                        color: Colors.black, child: const Text('Home Example')),
                    GenericInput(
                      width: context.percentWidth(.9),
                      label: 'Usuário',
                      placeholder: 'Digite o seu usuário',
                      controller: userController,
                      focusNode: userFocusNode,
                      nextFocusNode: passwordFocusNode,
                    ),
                    GenericInput(
                      width: context.percentWidth(.9),
                      label: 'Senha',
                      placeholder: 'Digite sua senha',
                      isPassword: true,
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      onFieldSubmitted: (term) => _onLoginButtonPressed(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
