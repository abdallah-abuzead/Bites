import 'package:bites/features/contacts/domain/entities/contact.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/networking/failures.dart';
import '../repository/contacts_repository.dart';

class GetUserContactsUseCase extends BaseUseCase<List<Contact>> {
  final ContactsRepository _repository;

  GetUserContactsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Contact>>> call() async => await _repository.getUserContacts();
}
