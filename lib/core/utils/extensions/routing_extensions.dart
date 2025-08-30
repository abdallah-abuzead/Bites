import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext? currentContext = navigatorKey.currentContext;

extension Navigation on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  }

  void pushReplacement(Widget widget) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => widget));
  }

  void pushAndRemoveUntil(Widget widget, [RoutePredicate? predicate]) {
    Navigator.of(
      this,
    ).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => widget), predicate ?? (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}
