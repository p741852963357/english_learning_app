class Validator {
  String? emailValidator(String email) {
    email = email.trim();
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email.isEmpty) {
      return 'Field is required';
    }
    if (!emailRegExp.hasMatch(email)) {
      return 'Please enter an invalid email';
    }
    return null;
  }

  String? passwordValidator(String password) {
    password = password.trim();
    if (password.isEmpty) {
      return 'Field is required';
    }
    if (password.length < 6) {
      return 'Password must contain at least 6 characters';
    }
    return null;
  }

  String? rePasswordValidator(String password, String rePassword) {
    rePassword = rePassword.trim();
    password = password.trim();
    if (rePassword.isEmpty) {
      return 'Field is required';
    }
    if (password != rePassword) {
      return 'passwords are not matched';
    }
    return null;
  }

  String? otpValidator(String otp) {
    otp = otp.trim();
    if (otp.isEmpty) {
      return 'Field is required';
    }
    if (otp.length != 6) {
      return 'OTP must contain exactly 6 characters';
    }
    return null;
  }
}
