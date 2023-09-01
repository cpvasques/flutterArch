import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {}

class RemoteFailure extends Failure {
  final String message;

  RemoteFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class UnknownFailure extends Failure {
  final dynamic exception;

  UnknownFailure({
    required this.exception,
  });

  @override
  List<Object?> get props => [
        exception,
      ];
}
