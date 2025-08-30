import 'package:dartz/dartz.dart';

import '../networking/failures.dart';

abstract class BaseUseCaseWithParams<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

abstract class BaseUseCase<Output> {
  Future<Either<Failure, Output>> call();
}
