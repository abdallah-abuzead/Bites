import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../providers/contacts_provider.dart';
import '../widgets/contacts_list.dart';
import '../widgets/image_and_ask_me_text.dart';

class ContactsScreen extends ConsumerWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradient3Background, AppColors.gradient1Background],
            begin: AlignmentGeometry.centerLeft,
            end: AlignmentGeometry.centerRight,
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () => ref.read(contactsProvider.notifier).getUserContacts(),
          child: ListView(
            children: [50.heightBox, const ImageAndAskMeText(), 50.heightBox, const ContactsList()],
          ),
        ),
      ),
    );
  }
}
