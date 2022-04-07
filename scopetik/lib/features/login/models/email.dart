import 'package:formz/formz.dart';

enum EmailValidationError {
  empty,
  invalidEmail,
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    final RegExp emailReg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else if (!emailReg.hasMatch(value)) {
      return EmailValidationError.invalidEmail;
    } else {
      return null;
    }
  }
}
