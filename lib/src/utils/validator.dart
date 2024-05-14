class Validator {
  static String? name(String? v) {
    if (v == null || v.isEmpty) {
      // return null;
      return 'Name is required.';
    }

    if (v.length < 3) {
      return 'Name should not be less then 3 characters.';
    }
    return null;
  }

  static String? email(String? v) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);

    if (v == null || v.isEmpty) {
      return 'Email is required.';
    }

    if (!regex.hasMatch(v) || !v.endsWith(".com")) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? mobile(String? v) {
    if (v == null || v.isEmpty) {
      return 'Mobile number is required.';
    }

    if (v.length != 11) {
      // return 'Please enter a valid mobile number.';
      // return 'Please enter a proper mobile number.';
      return '11 digits required.';
    }

    return null;
  }

  static String? password(String? v) {
    if (v == null || v.isEmpty) {
      return 'Password is required.';
    }

    if (v.length < 8) {
      return 'Password should be at least 8 characters.';
    }

    return null;
  }

  static String? confirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Password is required.';
    }

    if (confirmPassword.length < 8) {
      return 'Password should be at least 8 characters.';
    }

    if (confirmPassword != password) {
      return 'Passwords do not match.';
    }

    return null;
  }

  static String? otp(String? v) {
    if (v == null || v.isEmpty) {
      return 'OTP is required.';
    }

    if (v.length != 6) {
      // return 'Please enter a valid mobile number.';
      // return 'Please enter a proper mobile number.';
      return '6 digits required.';
    }

    return null;
  }

  static String? address(String? v) {
    if (v == null || v.isEmpty) {
      return 'Address is required';
    }

    if (v.length < 10) {
      return 'Should not be less then 10 characters.';
    }
    return null;
  }

  static String? addressLandmark(String? v) {
    if (v == null || v.isEmpty) {
      return 'Address Landmark is required';
    }

    if (v.length < 10) {
      return 'Should not be less then 10 characters.';
    }
    return null;
  }
}
