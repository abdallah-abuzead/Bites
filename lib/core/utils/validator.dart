import 'package:bites/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? requiredFieldValidator(String? text) {
    if (text!.trim().isEmpty) return LocaleKeys.requiredValidation.tr();
    return null;
  }
}
