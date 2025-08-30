import 'package:bites/core/localization/app_locale.dart';
import 'package:bites/core/utils/extensions/routing_extensions.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:bites/features/auth/presentation/screens/login_screen.dart';
import 'package:bites/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/di/app_injections.dart';
import '../../../../core/utils/cache_storage/secure_cache_storage.dart';
import '../../../../core/utils/cache_storage/secure_cache_storage_keys.dart';
import '../widgets/profile_item.dart';
import '../widgets/user_profile_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.r),
      children: [
        50.heightBox,
        const UserProfileData(),
        30.heightBox,
        ProfileItem(
          title: LocaleKeys.language.tr(),
          icon: AppAssets.contact,
          trailing: AppLocale.isEnglish ? 'العربية' : 'English',
          onTap: () async {
            await AppLocale.toggleLocale();
            setState(() {});
          },
        ),
        16.heightBox,
        ProfileItem(
          title: LocaleKeys.logout.tr(),
          icon: AppAssets.contact,
          onTap: () {
            context.pushAndRemoveUntil(const LoginScreen());
            getIt<SecureCacheStorage>().removeData(key: SecureCacheStorageKeys.token);
          },
        ),
      ],
    );
  }
}
