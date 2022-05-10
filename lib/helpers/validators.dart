import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
      r'''^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$''');

  @override
  NameValidationError? validator(String value) {
    bool nameLimit = value.length <= 40;
    return nameLimit && _nameRegExp.hasMatch(value)
        ? null
        : NameValidationError.invalid;
  }
}

enum LastNameValidationError { invalid }

class LastName extends FormzInput<String, LastNameValidationError> {
  const LastName.pure() : super.pure('');
  const LastName.dirty([String value = '']) : super.dirty(value);

  static final RegExp _lastNameRegEx = RegExp(
      r'''^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$''');

  @override
  LastNameValidationError? validator(String value) {
    bool nameLimit = value.length <= 40;
    return nameLimit && _lastNameRegEx.hasMatch(value)
        ? null
        : LastNameValidationError.invalid;
  }
}

enum WeigthValidationError { invalid }

class Weigth extends FormzInput<double, WeigthValidationError> {
  const Weigth.pure() : super.pure(40);
  const Weigth.dirty([double value = 40]) : super.dirty(value);

  @override
  WeigthValidationError? validator(double value) {
    return value.isNegative || value == 0
        ? WeigthValidationError.invalid
        : null;
  }
}

enum HeigthValidationError { invalid }

class Heigth extends FormzInput<double, HeigthValidationError> {
  const Heigth.pure() : super.pure(1.70);
  const Heigth.dirty([double value = 1.70]) : super.dirty(value);

  @override
  HeigthValidationError? validator(double value) {
    return value.isNegative || value == 0
        ? HeigthValidationError.invalid
        : null;
  }
}

enum BirthDateValidationError { invalid }

class BirthDate extends FormzInput<DateTime?, BirthDateValidationError> {
  const BirthDate.pure() : super.pure(null);
  const BirthDate.dirty([DateTime? value]) : super.dirty(value);

  static final DateTime _minDate =
      DateTime.now().subtract(const Duration(days: 365 * 18));

  @override
  BirthDateValidationError? validator(DateTime? value) {
    return value == null || value.isAfter(_minDate)
        ? BirthDateValidationError.invalid
        : null;
  }
}
