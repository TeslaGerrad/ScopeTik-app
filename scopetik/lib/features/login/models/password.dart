import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalidPassword }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    final RegExp passwordRegExp =
        RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (!passwordRegExp.hasMatch(value)) {
      return PasswordValidationError.invalidPassword;
    } else {
      return null;
    }
  }
}
