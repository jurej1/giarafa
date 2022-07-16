import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.dirty([String val = '']) : super.dirty(val);
  const Email.pure([String val = '']) : super.pure(val);

  @override
  EmailValidationError? validator(String value) {
    return null;
  }
}
