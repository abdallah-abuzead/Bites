import 'package:flutter/foundation.dart';

void printf(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}
