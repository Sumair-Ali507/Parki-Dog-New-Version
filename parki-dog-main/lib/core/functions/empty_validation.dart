import 'package:easy_localization/easy_localization.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

String? validateRequiredField(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.validation_emptyField.tr();
  }
  return null;
}
