import 'package:app_flutter_arch/app/core/controller/base/base_controller_state.dart';
import 'package:app_flutter_arch/app/core/controller/base/base_state_error.dart';
import 'package:app_flutter_arch/app/core/result/failure.dart';
import 'package:app_flutter_arch/app/core/result/result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubitController<S extends BaseControllerState>
    extends Cubit<S> {
  BaseCubitController(
    super.initialState,
  );

  bool emitStateIfFailure<D>(Result<D> result) {
    if (result.isSuccess()) return false;

    final failure = result.failure!;
    emit(state.copyWithError(
      stateError: getStateErrorByFailure(failure),
      failure: failure,
    ));

    _emitStateErrorCleanerState();

    return true;
  }

  @protected
  BaseStateError getStateErrorByFailure(Failure failure) {
    return switch (failure) {
      RemoteFailure() => BaseStateError.remote,
      UnknownFailure() => BaseStateError.unknown,
    };
  }

  void _emitStateErrorCleanerState() {
    emit(
      state.copyWithError(
        stateError: BaseStateError.none,
      ),
    );
  }
}
