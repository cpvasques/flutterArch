import 'package:app_flutter_arch/app/core/result/failure.dart';
import 'package:equatable/equatable.dart';

enum Status {
  success,
  failure,
}

class Result<D> extends Equatable {
  final Status status;
  final D? data;
  final Failure? failure;

  const Result._({
    required this.status,
    this.data,
    this.failure,
  });

  factory Result.success({
    required D data,
  }) {
    return Result._(
      status: Status.success,
      data: data,
    );
  }

  factory Result.fail({
    required Failure failure,
  }) {
    return Result._(
      status: Status.failure,
      failure: failure,
    );
  }

  bool isSuccess() => status == Status.success;

  @override
  List<Object?> get props => <Object?>[
        status,
        data,
        failure,
      ];
}
