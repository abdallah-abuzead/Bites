import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../widgets/login_form.dart';
import '../widgets/logo_and_google_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [const LogoAndGoogleButtonSection(), 30.heightBox, const LoginForm()],
      ),
    );
  }
}
