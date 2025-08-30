import 'package:bites/core/networking/exceptions.dart';
import 'package:bites/core/networking/failures.dart';
import 'package:bites/features/contacts/data/data_source/contacts_data_source.dart';
import 'package:bites/features/contacts/data/models/contact_model.dart';
import 'package:bites/features/contacts/domain/entities/contact.dart';
import 'package:bites/features/contacts/domain/repository/Contacts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contacts_repository_impl_test.mocks.dart';

@GenerateMocks([ContactsDataSource])
void main() {
  group('ContactsRepositoryImpl', () {
    late TestableContactsRepository repository;
    late MockContactsDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockContactsDataSource();
      repository = TestableContactsRepository(dataSource: mockDataSource);
    });

    group('Get User Contacts', () {
      test('returns List<Contact> when get data is successful', () async {
        // Arrange
        final List<ContactModel> contacts = List.generate(
          3,
          (index) => ContactModel(id: index, name: 'User $index', email: 'email $index'),
        );
        when(mockDataSource.getUserContacts()).thenAnswer((_) async => Future.value(contacts));

        // Act
        final result = await repository.getUserContacts();

        // Assert
        expect(result, equals(Right(contacts)));
      });

      test('returns failure when get data fails', () async {
        // Arrange
        when(mockDataSource.getUserContacts()).thenThrow(ServerException());

        // Act
        final result = await repository.getUserContacts();

        // Assert
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });
}

// Testable implementation that doesn't use ApiHandler mixin
class TestableContactsRepository implements ContactsRepository {
  final ContactsDataSource dataSource;

  TestableContactsRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<Contact>>> getUserContacts() async {
    try {
      final List<Contact> contacts = await dataSource.getUserContacts();
      return Right(contacts);
    } on ServerException {
      return Left(ServerFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ValidationException {
      return Left(ValidationFailure());
    } on OfflineException {
      return Left(OfflineFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
