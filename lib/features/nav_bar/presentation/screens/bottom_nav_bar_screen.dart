import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../providers/nav_bar_provider.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class CustomBottomNavScreen extends ConsumerStatefulWidget {
  const CustomBottomNavScreen({super.key});
  final int initialIndex = 3;

  @override
  CustomBottomNavScreenState createState() => CustomBottomNavScreenState();
}

class CustomBottomNavScreenState extends ConsumerState<CustomBottomNavScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      ref.read(navBarProvider.notifier).setIndex(widget.initialIndex);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(navBarProvider);
    final Widget selectedScreen = ref.watch(navBarProvider.notifier).screens[selectedIndex];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.gradient3Background, AppColors.gradient1Background],
          begin: AlignmentGeometry.centerLeft,
          end: AlignmentGeometry.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: selectedScreen,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: FloatingActionButton(
            backgroundColor: AppColors.primary,
            shape: const CircleBorder(),
            onPressed: () {},
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white, size: 30.sp),
              onPressed: () {},
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
