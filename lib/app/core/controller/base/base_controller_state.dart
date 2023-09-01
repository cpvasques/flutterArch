import 'package:app_flutter_arch/app/core/controller/base/base_state_error.dart';
import 'package:app_flutter_arch/app/core/result/failure.dart';
import 'package:equatable/equatable.dart';

abstract class BaseControllerState<S> extends Equatable {
  final BaseStateError stateError;
  final Failure? failure;

  const BaseControllerState({
    required this.stateError,
    required this.failure,
  });

  bool get hasErrors => stateError != BaseStateError.none;

  S copyWithError({
    BaseStateError? stateError,
    Failure? failure,
  });

  @override
  List<Object?> get props => <Object?>[
        stateError,
        failure,
      ];
}
