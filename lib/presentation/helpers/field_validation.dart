import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery/presentation/extension/field_error_extension.dart';
import 'package:gallery/presentation/resources/app_enums.dart';

class FieldValidation {
  static Map<Field, ErrorInputField> confirmPasswordValidate({
    required String confirmPassword,
    required String password,
  }) {
    if (confirmPassword.isEmpty) {
      return {Field.confirmPassword: ErrorInputField.unconfirmedPassword};
    }
    if (confirmPassword != password) {
      return {Field.confirmPassword: ErrorInputField.passwordMismatch};
    }

    return {};
  }

  static Map<Field, ErrorInputField> phoneValidate({
    required String phone,
  }) {
    if (phone.isNotEmpty && phone.length < 17) {
      return {Field.phone: ErrorInputField.invalidPhone};
    }
    if (phone.isEmpty) {
      return {Field.phone: ErrorInputField.emptyPhone};
    }
    return {};
  }

  static Map<Field, ErrorInputField> usernameValidate({
    required String username,
  }) {
    if (username.isEmpty) {
      return {Field.username: ErrorInputField.emptyUsername};
    }
    return {};
  }

  static Map<Field, ErrorInputField> emailValidate({
    required String email,
  }) {
    if (email.isEmpty) {
      return {Field.email: ErrorInputField.emptyEmail};
    }
    if (!AppConst.emailRegExp.hasMatch(email)) {
      return {Field.email: ErrorInputField.invalidEmail};
    }
    return {};
  }

  static Map<Field, ErrorInputField> passwordValidate({
    required String password,
  }) {
    if (password.isEmpty) {
      return {Field.password: ErrorInputField.emptyPassword};
    }
    if (password.length < 5) {
      return {Field.password: ErrorInputField.shortPassword};
    }
    return {};
  }

  static validateInput(
    String value,
    Field? field,
    TextEditingController? passwordController,
    context,
  ) {
    Map<Field, ErrorInputField> errors;
    switch (field) {
      case Field.username:
        errors = FieldValidation.usernameValidate(username: value);
        break;

      case Field.phone:
        errors = FieldValidation.phoneValidate(phone: value);
        break;
      case Field.email:
        errors = FieldValidation.emailValidate(email: value);
        break;
      case Field.password:
        errors = FieldValidation.passwordValidate(password: value);
        break;
      case Field.confirmPassword:
        if (passwordController != null) {
          errors = FieldValidation.confirmPasswordValidate(
            confirmPassword: value,
            password: passwordController.text,
          );
        } else {
          errors = {};
        }
        break;
      default:
        errors = {};
    }
    String? errorText = errors.isNotEmpty ? errors.values.first.getLocalizedErrorMessage(context.localization) : null;
    return errorText;
  }
}
