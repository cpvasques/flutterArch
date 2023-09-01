import 'package:app_flutter_arch/app/core/controller/base/base_controller_state.dart';
import 'package:app_flutter_arch/app/core/controller/base/base_state_error.dart';
import 'package:app_flutter_arch/app/core/result/failure.dart';
import 'package:match/match.dart';

import 'package:app_flutter_arch/app/dto/dto_example.dart';
import 'package:app_flutter_arch/app/models/model_example.dart';

part 'home_state.g.dart';
//Sempre que gerar um novo state, rode o build runner para gerar um watcher.
// Comando para gerar o watcher:
// flutter pub run build_runner watch -d

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
  noError,
}

class HomeState extends BaseControllerState<HomeState> {
  final HomeStateStatus status;
  final List<ModelExample> itemExample;
  final List<ExampleDto> listSavedOnStoreExample;

  const HomeState({
    required this.status,
    required this.itemExample,
    required this.listSavedOnStoreExample,
    super.stateError = BaseStateError.none,
    super.failure,
  });

  factory HomeState.initial() {
    return const HomeState(
      status: HomeStateStatus.initial,
      itemExample: [],
      listSavedOnStoreExample: [],
    );
  }

  @override
  List<Object?> get props =>
      [
        super.props,
        status,
        itemExample,
        listSavedOnStoreExample,
      ];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ModelExample>? products,
    String? errorMessage,
    List<ExampleDto>? listSavedOnStoreExample,
  }) {
    return HomeState(
      status: status ?? this.status,
      itemExample: products ?? itemExample,
      listSavedOnStoreExample:
          listSavedOnStoreExample ?? this.listSavedOnStoreExample,
      failure: failure,
      stateError: stateError,
    );
  }

  @override
  HomeState copyWithError({
    BaseStateError? stateError,
    Failure? failure,
  }) {
    return HomeState(
      status: HomeStateStatus.error,
      itemExample: itemExample,
      listSavedOnStoreExample: listSavedOnStoreExample,
      failure: failure ?? this.failure,
      stateError: stateError ?? this.stateError,
    );
  }
}
