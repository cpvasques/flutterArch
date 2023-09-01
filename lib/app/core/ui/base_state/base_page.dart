import 'package:app_flutter_arch/app/core/ui/base_state/base_state.dart';
import 'package:app_flutter_arch/app/core/ui/base_state/state_with_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePage<T extends StatefulWidget, C extends BlocBase>
    extends BaseState<T> with StateWithController<T, C> {}
