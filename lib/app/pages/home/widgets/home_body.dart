import 'package:app_flutter_arch/app/core/ui/base_state/base_state.dart';
import 'package:app_flutter_arch/app/core/ui/base_state/state_with_controller.dart';
import 'package:app_flutter_arch/app/core/ui/helpers/size_extensions.dart';
import 'package:app_flutter_arch/app/core/ui/widgets/generic_input.dart';
import 'package:app_flutter_arch/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends BaseState<HomeBody>
    with StateWithController<HomeBody, HomeController> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _loginFormKey,
          child: Column(
            children: [
              Title(color: Colors.black, child: const Text('Home Example')),
              GenericInput(
                width: context.percentWidth(.9),
                label: 'Usuário',
                placeholder: 'Digite o seu usuário',
                controller: _userController,
                focusNode: _userFocusNode,
                nextFocusNode: _passwordFocusNode,
              ),
              GenericInput(
                width: context.percentWidth(.9),
                label: 'Senha',
                placeholder: 'Digite sua senha',
                isPassword: true,
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                onFieldSubmitted: (term) => _onLoginButtonPressed(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _onLoginButtonPressed() async {
    controller.login(
      user: _userController.text,
      password: _passwordController.text,
    );
  }
}
