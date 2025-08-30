import 'package:bites/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../providers/nav_bar_provider.dart';

class NavBarItem extends ConsumerWidget {
  const NavBarItem({super.key, required this.icon, required this.index});
  final String icon;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(navBarProvider) == index;
    return GestureDetector(
      onTap: () => ref.read(navBarProvider.notifier).setIndex(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColors.iconActive : AppColors.iconInactive,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
