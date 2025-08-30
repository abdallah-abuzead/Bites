import 'package:bites/features/contacts/data/models/contact_model.dart';
import 'package:dio/dio.dart';

import '../../../../../core/networking/api_handler.dart';
import '../../../../../core/networking/end_points.dart';

abstract class ContactsDataSource {
  Future<List<ContactModel>> getUserContacts();
}

class ContactsDataSourceImpl extends ContactsDataSource with ApiHandler {
  final Dio dio;
  ContactsDataSourceImpl({required this.dio});
  @override
  Future<List<ContactModel>> getUserContacts() async {
    return await handleDataSourceRequest(
      onTry: () => dio.get(EndPoints.contacts),
      onSuccess: (response) =>
          (response.data as List).map((contact) => ContactModel.fromJson(contact)).toList(),
    );
  }
}
