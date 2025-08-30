import 'package:bites/features/contacts/data/data_source/contacts_data_source.dart';
import 'package:bites/features/contacts/domain/repository/contacts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/networking/api_handler.dart';
import '../../../../core/networking/failures.dart';
import '../../domain/entities/contact.dart';

class ContactsRepositoryImpl extends ContactsRepository with ApiHandler {
  final ContactsDataSource dataSource;
  ContactsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<Contact>>> getUserContacts() {
    return handleRepoFunction(onTry: () async => await dataSource.getUserContacts());
  }
}
