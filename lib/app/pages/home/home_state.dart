import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:app_flutter_arch/app/dto/dto_example.dart';
import 'package:app_flutter_arch/app/models/model_example.dart';

part 'home_state.g.dart';
//Sempre que gerar um novo state, rode o build runner para gerar um watcher.
// Comando para gerar o watcher:
// flutter pub run build_runner watch -d

@match
enum HomeStateStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ModelExample> itemExample;
  final String? errorMessage;
  final List<ExampleDto> listSavedOnStoreExample;

  const HomeState({
    required this.status,
    required this.itemExample,
    required this.listSavedOnStoreExample,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        itemExample = const [],
        listSavedOnStoreExample = const [],
        errorMessage = null;

  @override
  List<Object?> get props =>
      [status, itemExample, errorMessage, listSavedOnStoreExample];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ModelExample>? products,
    String? errorMessage,
    List<ExampleDto>? listSavedOnStoreExample,
  }) {
    return HomeState(
      status: status ?? this.status,
      itemExample: products ?? this.itemExample,
      errorMessage: errorMessage ?? this.errorMessage,
      listSavedOnStoreExample:
          listSavedOnStoreExample ?? this.listSavedOnStoreExample,
    );
  }
}
