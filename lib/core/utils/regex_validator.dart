class RegexValidator {
  RegexValidator._();

  static final password = RegExp(r"^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+$");
  static final mobile = RegExp(r'^\d{10}$');
  static final firstLetterNumber = RegExp(r'^\d');
  static final firstLetterAlphaBet = RegExp(r'^[a-zA-Z]');

  static final RegExp validUrl =
      RegExp(r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$');

  static final RegExp phone = RegExp(
    r'^(?:\+?[0-9]{1,3})?[0-9]{10,12}$',
  );

  static final RegExp email = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );
}
