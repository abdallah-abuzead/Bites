import 'package:dartz/dartz.dart';

import '../../../../core/networking/failures.dart';
import '../entities/contact.dart';

abstract class ContactsRepository {
  Future<Either<Failure, List<Contact>>> getUserContacts();
}
