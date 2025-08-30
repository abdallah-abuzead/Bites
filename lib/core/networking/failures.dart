import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../constants/app_strings.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class OfflineFailure extends Failure {}

class ServerFailure extends Failure {}

class ValidationFailure extends Failure {
  final String? message;
  ValidationFailure({this.message});
}

class UnauthorizedFailure extends Failure {
  final String? message;
  UnauthorizedFailure({this.message});
}

class DataTypeChangeFailure extends Failure {}

class ConnectionTimeoutFailure extends Failure {}

class ConnectionErrorFailure extends Failure {}

class EmptyCacheFailure extends Failure {}

String getFailureMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (OfflineFailure):
      return AppStrings.offlineErrorMessage.tr();
    case const (UnauthorizedFailure):
      return AppStrings.unauthorizedErrorMessage.tr();
    case (const (ValidationFailure)):
      return (failure as ValidationFailure).message ?? AppStrings.validationErrorMessage.tr();
    case const (DataTypeChangeFailure):
      return AppStrings.dataTypeChangeErrorMessage.tr();
    case const (ServerFailure):
      return AppStrings.serverErrorMessage.tr();
    default:
      return AppStrings.somethingWentWrongErrorMessage.tr();
  }
}
