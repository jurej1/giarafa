import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.dirty([String val = '']) : super.dirty(val);
  const Password.pure([String val = '']) : super.pure(val);

  @override
  PasswordValidationError? validator(String value) {
    return value.length < 6 ? PasswordValidationError.invalid : null;
  }
}
