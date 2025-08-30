import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import 'bottom_nav_painter.dart';
import 'nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          // Custom shaped bottom bar
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 80),
            painter: BottomNavPainter(),
          ),
          // Navigation items
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavBarItem(icon: AppAssets.person, index: 0),
                  NavBarItem(icon: AppAssets.notification, index: 1),
                  Spacer(),
                  NavBarItem(icon: AppAssets.time, index: 2),
                  NavBarItem(icon: AppAssets.calendar, index: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
