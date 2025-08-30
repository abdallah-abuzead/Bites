import 'package:bites/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/networking/failures.dart';
import '../entities/requests/login_request.dart';

class LoginUseCase extends BaseUseCaseWithParams<String, LoginRequest> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(LoginRequest request) async =>
      await _repository.login(request);
}
