// format untuk pola email dan password
class RegexPatterns {
  static final RegExp email = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp passwordStrong = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}$',
  );

  static final RegExp phone = RegExp(
    r'^08[0-9]{8,11}$',
  );

  static final RegExp onlyLetters = RegExp(
    r'^[a-zA-Z\s]+$',
  );

  static final RegExp alphanumeric = RegExp(
    r'^[a-zA-Z0-9]+$',
  );

  static final RegExp url = RegExp(
    r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
  );
}