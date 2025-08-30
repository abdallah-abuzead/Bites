// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedSplashScreen(
        duration: 1500,
        splashIconSize: double.infinity,
        animationDuration: const Duration(milliseconds: 1000),
        splashTransition: SplashTransition.scaleTransition,
        curve: Curves.fastLinearToSlowEaseIn,
        pageTransitionType: PageTransitionType.rightToLeft,
        splash: SvgPicture.asset(AppAssets.logo),
        nextScreen: const LoginScreen(),
      ),
    );
  }
}
