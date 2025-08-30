import 'package:bites/core/di/app_injections.dart';
import 'package:bites/features/contacts/domain/entities/contact.dart';
import 'package:bites/features/contacts/domain/use_cases/get_user_contacts_use_case.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/failures.dart';

part 'contacts_provider.freezed.dart';

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState.initial() = _Initial;
  const factory ContactsState.loading() = Loading;
  const factory ContactsState.success(List<Contact> contacts) = Success;
  const factory ContactsState.error({required Failure failure}) = Error;
}

class ContactsNotifier extends StateNotifier<ContactsState> {
  final GetUserContactsUseCase getContactsUseCase;

  ContactsNotifier({required this.getContactsUseCase}) : super(const ContactsState.initial());

  Future<void> getUserContacts() async {
    state = ContactsState.loading();
    final result = await getContactsUseCase();
    result.fold(
      (failure) => state = ContactsState.error(failure: failure),
      (contacts) => state = ContactsState.success(contacts),
    );
  }
}

final contactsProvider = StateNotifierProvider<ContactsNotifier, ContactsState>(
  (ref) => ContactsNotifier(getContactsUseCase: getIt()),
);
