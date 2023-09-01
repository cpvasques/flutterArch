import 'package:app_flutter_arch/app/core/result/failure.dart';
import 'package:app_flutter_arch/app/core/ui/styles/colors_app.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showFailureError(Failure? failure) {
    final String? errorMessage = switch (failure) {
      RemoteFailure() => failure.message,
      UnknownFailure() => null,
      null => null,
    };
    showError(errorMessage ?? 'Erro não informado');
  }

  void showError(String message) {
    Flushbar(
      backgroundColor: ColorsApp.instance.red,
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: Icon(
        Icons.error,
        color: ColorsApp.instance.white,
      ),
      margin: const EdgeInsets.all(8),
      message: message,
    ).show(context);
  }

  void showInfo(String message) {
    Flushbar(
      backgroundColor: ColorsApp.instance.orange,
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: Icon(
        Icons.warning,
        color: ColorsApp.instance.white,
      ),
      margin: const EdgeInsets.all(8),
      message: message,
    ).show(context);
  }

  void showSuccess(String message) {
    Flushbar(
      backgroundColor: ColorsApp.instance.green,
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: Icon(
        Icons.done,
        color: ColorsApp.instance.white,
      ),
      margin: const EdgeInsets.all(8),
      message: message,
    ).show(context);
  }
}
