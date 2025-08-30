import 'package:bites/core/utils/validator.dart';
import 'package:bites/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validator.requiredFieldValidator', () {
    test('returns error message when input is empty string', () {
      // Override tr() method temporarily by extension or mock
      final result = Validator.requiredFieldValidator('  ');
      expect(result, LocaleKeys.requiredValidation.tr());
    });

    test('returns null when input is non-empty string', () {
      final result = Validator.requiredFieldValidator('Hello');
      expect(result, null);
    });
  });
}
