import 'package:app_flutter_arch/app/core/ui/helpers/loader.dart';
import 'package:app_flutter_arch/app/core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with Loader, Messages {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
