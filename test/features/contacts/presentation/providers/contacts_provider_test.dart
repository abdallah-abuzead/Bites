import 'package:bites/core/networking/failures.dart';
import 'package:bites/features/contacts/domain/entities/contact.dart';
import 'package:bites/features/contacts/domain/use_cases/get_user_contacts_use_case.dart';
import 'package:bites/features/contacts/presentation/providers/contacts_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contacts_provider_test.mocks.dart';

@GenerateMocks([GetUserContactsUseCase])
void main() {
  group('ContactsNotifier', () {
    late ContactsNotifier contactsNotifier;
    late MockGetUserContactsUseCase mockGetContactsUseCase;

    setUp(() {
      mockGetContactsUseCase = MockGetUserContactsUseCase();
      contactsNotifier = ContactsNotifier(getContactsUseCase: mockGetContactsUseCase);
    });

    group('get contacts', () {
      test('should emit success state when get contacts is successful', () async {
        // Arrange
        final List<Contact> contacts = List.generate(
          3,
          (index) => Contact(id: index, name: 'User $index', email: 'email $index'),
        );
        when(mockGetContactsUseCase()).thenAnswer((_) async => Right(contacts));

        // Act
        await contactsNotifier.getUserContacts();

        // Assert
        expect(contactsNotifier.state, equals(ContactsState.success(contacts)));
      });

      test('should emit error state when get contacts fails', () async {
        // Arrange
        final failure = ServerFailure();
        when(mockGetContactsUseCase()).thenAnswer((_) async => Left(failure));

        // Act
        await contactsNotifier.getUserContacts();

        // Assert
        expect(contactsNotifier.state, equals(ContactsState.error(failure: failure)));
      });
    });
  });
}
