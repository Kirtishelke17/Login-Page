class Validator {
  static String? validateEmailOrPhone(String? value) {
    if (value!.isEmpty) {
      return "Enter Email or Mobile Number";
    } else if (!value.contains('@') && value.length != 10) {
      return "Enter Valid Email or Mobile Number";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Enter Password";
    } else if (value.length < 6) {
      return "Password Length should be more than 6 characters";
    }
    return null;
  }

  static String? validateMessage(String? value) {
    if (value!.isEmpty) {
      return "Enter a message";
    }
    return null;
  }
}
