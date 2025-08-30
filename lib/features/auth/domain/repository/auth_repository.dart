import 'package:dartz/dartz.dart';

import '../../../../core/networking/failures.dart';
import '../entities/requests/login_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(LoginRequest request);
}
