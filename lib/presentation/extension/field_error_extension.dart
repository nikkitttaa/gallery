import 'package:gallery/generated/l10n.dart';
import 'package:gallery/presentation/resources/app_enums.dart';

extension FieldErrorExtension on ErrorInputField {
  String getLocalizedErrorMessage(AppLocalization localization) {
    return switch (this) {
      ErrorInputField.emptyPassword => localization.errorEmptyPassword,
      ErrorInputField.shortPassword => localization.errorShortPassword,
      ErrorInputField.emptyEmail => localization.errorEmptyEmail,
      ErrorInputField.invalidEmail => localization.errorInvalidEmail,
      ErrorInputField.emptyUsername => localization.errorEmptyUsername,
      ErrorInputField.emptyPhone => localization.errorEmptyPhone,
      ErrorInputField.invalidPhone => localization.errorInvalidPhone,
      ErrorInputField.invalidBirthday => localization.errorInvalidBirthday,
      ErrorInputField.passwordMismatch => localization.errorPasswordMismatch,
      ErrorInputField.unconfirmedPassword => localization.errorUnconfirmedPassword,
    };
  }
}
