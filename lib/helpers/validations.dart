class Validations {
  Validations();

  String? password(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{7,}$');
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Password is required");
    } else if (passNonNullValue.length < 6) {
      return ("Password Must be more than 6 characters");
    } else if (!regex.hasMatch(passNonNullValue)) {
      return ("Password should contain upper,lower,digit and Special character ");
    }
    return null;
  }

  String? userName(String? value) {
    String pattern = r'^.{10,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Username not valid ...';
    } else {
      return null;
    }
  }
}
