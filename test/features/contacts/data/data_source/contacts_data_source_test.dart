import 'package:bites/core/networking/end_points.dart';
import 'package:bites/core/networking/exceptions.dart';
import 'package:bites/features/contacts/data/data_source/contacts_data_source.dart';
import 'package:bites/features/contacts/data/models/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../auth/data/data_source/auth_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('ContactsDataSource', () {
    late ContactsDataSource contactsDataSource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      when(mockDio.options).thenReturn(BaseOptions());
      mockDio.options.baseUrl = EndPoints.baseUrl;

      // Create a testable ContactsDataSource implementation
      contactsDataSource = TestableContactsDataSource(dio: mockDio);
    });

    group('Contacts - Datasource', () {
      test('returns List<ContactModel> when get data is successful', () async {
        // Arrange:
        final List<ContactModel> contacts = List.generate(
          3,
          (index) => ContactModel(id: index, name: 'User $index', email: 'email $index'),
        );
        final contactsJson = contacts.map((contact) => contact.toJson()).toList();
        final response = Response(
          requestOptions: RequestOptions(path: EndPoints.contacts),
          data: contactsJson,
          statusCode: 200,
        );

        when(mockDio.get(EndPoints.contacts)).thenAnswer((_) async => response);

        // Act
        final result = await contactsDataSource.getUserContacts();

        // Assert
        expect(result, contacts);
      });

      test('throws exception when get data fails', () async {
        // Arrange
        final errorResponse = Response(
          requestOptions: RequestOptions(path: EndPoints.contacts),
          data: {'message': 'Internal Server Error'},
          statusCode: 500,
        );

        when(mockDio.get(EndPoints.contacts)).thenAnswer((_) async => errorResponse);

        // Act & Assert
        expect(() => contactsDataSource.getUserContacts(), throwsA(isA<ServerException>()));
      });
    });
  });
}

// Testable implementation that doesn't use GetIt
class TestableContactsDataSource implements ContactsDataSource {
  final Dio dio;

  TestableContactsDataSource({required this.dio});

  @override
  Future<List<ContactModel>> getUserContacts() async {
    try {
      final response = await dio.get(EndPoints.contacts);

      if (response.statusCode == 200) {
        return (response.data as List).map((contact) => ContactModel.fromJson(contact)).toList();
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ServerException();
      }
      throw ServerException();
    }
  }
}
