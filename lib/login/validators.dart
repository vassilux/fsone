class Validators {
  static final RegExp _usernameRegExp = RegExp(
    r'^(?=.*[a-z]){8,}$',
  );
  static final RegExp _passwordRegExp = RegExp(
   r'^(?=.*[a-z]){4,}$',
  );

  static isValidUsername(String username) {
    return username.length > 4 ? true : false; //.hasMatch(username);
  }

  static isValidPassword(String password) {
    //return _passwordRegExp.hasMatch(password);
    return password.length > 4 ? true : false; 
  }
}