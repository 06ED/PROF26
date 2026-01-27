class ValidationService {
  static bool validateEmail(String email) =>
      RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);

  static bool validatePassword(String password) =>
      password.isNotEmpty; // TODO: валидация пароля (если нужна по ТЗ)

  static bool validatePasswordsEquality(
    String password,
    String passwordConfirm,
  ) => passwordConfirm.isNotEmpty && password == passwordConfirm;
}
