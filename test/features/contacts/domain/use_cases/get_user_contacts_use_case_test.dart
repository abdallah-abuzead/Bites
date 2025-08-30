import 'package:bites/core/networking/failures.dart';
import 'package:bites/features/contacts/domain/entities/contact.dart';
import 'package:bites/features/contacts/domain/repository/contacts_repository.dart';
import 'package:bites/features/contacts/domain/use_cases/get_user_contacts_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_contacts_use_case_test.mocks.dart';

@GenerateMocks([ContactsRepository])
void main() {
  late MockContactsRepository mockContactsRepository;
  late GetUserContactsUseCase getUserContactsUseCase;
  setUp(() {
    mockContactsRepository = MockContactsRepository();
    getUserContactsUseCase = GetUserContactsUseCase(mockContactsRepository);
  });

  group('Test GetUserContactsUseCase', () {
    test('Return Right(List<Contact>) when success get contacts', () async {
      // Arrange
      final List<Contact> contacts = List.generate(
        3,
        (index) => Contact(id: index, name: 'User $index', email: 'email $index'),
      );
      when(
        mockContactsRepository.getUserContacts(),
      ).thenAnswer((_) async => Future.value(Right(contacts)));

      // Act
      final result = await getUserContactsUseCase();

      // Assert
      expect(result, equals(Right(contacts)));
    });

    test('Return Left(Failure) when failed get contacts', () async {
      // Arrange
      final failure = ServerFailure();
      when(
        mockContactsRepository.getUserContacts(),
      ).thenAnswer((_) async => Future.value(Left(ServerFailure())));

      // Act
      final result = await getUserContactsUseCase();

      // Assert
      expect(result, equals(Left(failure)));
    });
  });
}
