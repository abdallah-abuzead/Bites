import 'package:bites/core/theme/app_colors.dart';
import 'package:bites/core/theme/app_font_weight.dart';
import 'package:bites/core/utils/extensions/routing_extensions.dart';
import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:bites/core/widgets/app_button.dart';
import 'package:bites/core/widgets/app_text.dart';
import 'package:bites/core/widgets/loaders/loading_dialog.dart';
import 'package:bites/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/networking/failures.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/notifiers/toast.dart';
import '../../../contacts/presentation/providers/contacts_provider.dart';
import '../../../nav_bar/presentation/screens/bottom_nav_bar_screen.dart';
import '../../domain/entities/requests/login_request.dart';
import '../providers/auth_provider.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next is LoadingLogin) {
        loadingDialog(context);
      } else if (next is SuccessLogin) {
        ref.read(contactsProvider.notifier).getUserContacts();
        context.pushReplacement(const CustomBottomNavScreen());
      } else if (next is ErrorLogin) {
        context.pop();
        showToast(message: getFailureMessage(next.failure));
      }
    });

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              controller: _usernameController,
              title: LocaleKeys.username.tr(),
              keyboardType: TextInputType.name,
              action: TextInputAction.next,
              validator: (value) => Validator.requiredFieldValidator(value),
            ),
            16.heightBox,
            AppTextField(
              controller: _passwordController,
              title: LocaleKeys.password.tr(),
              isPassword: _obscurePassword,
              action: TextInputAction.done,
              validator: (value) => Validator.requiredFieldValidator(value),
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                icon: Icon(
                  _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: _obscurePassword ? AppColors.primary : AppColors.grey,
                ),
              ),
            ),
            20.heightBox,
            AppText(
              LocaleKeys.forgotPassword.tr(),
              color: AppColors.primary,
              fontSize: 12.sp,
              fontWeight: AppFontWeight.semiBold,
            ),
            30.heightBox,
            AppButton(title: LocaleKeys.login.tr(), onPressed: () => _handleLogin()),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(LocaleKeys.dontHaveAccount.tr()),
                5.widthBox,
                AppText(
                  LocaleKeys.signUp.tr(),
                  color: AppColors.primary,
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.semiBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(authProvider.notifier)
          .login(
            LoginRequest(
              username: _usernameController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
