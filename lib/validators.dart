class Validators {
  static final RegExp _usernameRegExp = RegExp(
    r'^(?=.*[a-z]){8,}$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static isValidUsername(String username) {
    return username.length > 4 ? true : false; //.hasMatch(username);
  }

  static isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}