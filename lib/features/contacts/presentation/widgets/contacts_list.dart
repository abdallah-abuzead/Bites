import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:bites/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_error_widget.dart';
import '../../../../core/widgets/loaders/loading_widget.dart';
import '../providers/contacts_provider.dart';
import 'contact_card.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(contactsProvider);
    if (state is Success) {
      return state.contacts.isEmpty
          ? EmptyWidget(
              text: LocaleKeys.noContactsFound.tr(),
              onPressed: () => ref.read(contactsProvider.notifier).getUserContacts(),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.contacts.length,
              separatorBuilder: (context, index) => 16.heightBox,
              itemBuilder: (context, i) => ContactCard(contact: state.contacts[i]),
            );
    } else if (state is Error) {
      return AppErrorWidget(
        failure: state.failure,
        onPressed: () => ref.read(contactsProvider.notifier).getUserContacts(),
      );
    }
    {
      return LoadingWidget(padding: 100.h);
    }
  }
}
