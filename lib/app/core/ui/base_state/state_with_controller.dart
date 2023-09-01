import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin StateWithController<T extends StatefulWidget, C extends BlocBase>
    on State<T> {
  late final C controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = context.read<C>();
  }
}
