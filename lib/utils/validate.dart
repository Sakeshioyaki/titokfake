class ValidateString {
  static String validateMail({required String email}) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email.trim().isEmpty) {
      return 'Enter your email!';
    } else if (!regex.hasMatch(email)) {
      return 'Validate Email!';
    } else {
      return '';
    }
  }

  static String validatePass(
      {required String pass, required String confirmPass}) {
    String pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])$';
    RegExp regExp = RegExp(pattern);
    if (pass.trim().isEmpty) {
      return 'Enter your pass!';
    } else if (pass.trim().length < 8) {
      return 'MK > 6 chu so';
    } else if (regExp.hasMatch(pass)) {
      return 'Validate pass co chu in hoa , in thuong va so';
    } else if (confirmPass != pass) {
      return 'Password must same confirm password';
    } else {
      return '';
    }
  }
}
