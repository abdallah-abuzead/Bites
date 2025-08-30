import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../contacts/presentation/screens/contacts_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

final navBarProvider = StateNotifierProvider<NavBarNotifier, int>((ref) {
  return NavBarNotifier();
});

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier() : super(3);

  final int initialIndex = 3;
  final List<Widget> screens = [
    const ProfileScreen(),
    const Center(child: Text('Notifications Screen')),
    const Center(child: Text('History Screen')),
    const ContactsScreen(),
  ];

  void setIndex(int index) {
    state = index;
  }
}
