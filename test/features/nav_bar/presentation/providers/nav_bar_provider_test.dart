import 'package:bites/features/contacts/presentation/screens/contacts_screen.dart';
import 'package:bites/features/nav_bar/presentation/providers/nav_bar_provider.dart';
import 'package:bites/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProviderContainer container;
  late NavBarNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = NavBarNotifier();
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is 3', () {
    expect(notifier.state, 3);
    expect(notifier.initialIndex, 3);
  });

  test('screens list contains 4 widgets', () {
    expect(notifier.screens.length, 4);
    expect(notifier.screens[0], isA<ProfileScreen>());
    expect(notifier.screens[3], isA<ContactsScreen>());
  });

  test('setIndex updates the state', () {
    notifier.setIndex(1);
    expect(notifier.state, 1);

    notifier.setIndex(0);
    expect(notifier.state, 0);
  });
}
