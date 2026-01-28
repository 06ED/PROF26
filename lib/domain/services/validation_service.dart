class ValidationService {
  static final _emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  static bool validateEmail(String email) => _emailRegExp.hasMatch(email);

  static bool validatePassword(String password) =>
      password.isNotEmpty; // TODO: валидация пароля (если нужна по ТЗ)

  static bool validatePasswordsEquality(
    String password,
    String passwordConfirm,
  ) => passwordConfirm.isNotEmpty && password == passwordConfirm;
}
