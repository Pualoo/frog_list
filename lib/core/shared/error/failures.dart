import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({this.errorMessage = "Unexpected error"});

  @override
  List<Object> get props => [errorMessage];
}

//General failures
class NotFoundFailure extends Failure {}

class AlreadyExistFailure extends Failure {}

class CacheFailure extends Failure {}

class UnexpectedFailure extends Failure {}

class PermissionFailure extends Failure {}
