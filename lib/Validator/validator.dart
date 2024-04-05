import 'dart:core';


var emailPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
var namePattern = r'[a-zA-Z]';

class Validator {

  static String? validateEmail(String value) {
    var pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please enter a valid email address.';
    // else return null;
  }

  static String? validatePassword(String value) {
    var pattern = r"^.{6,}$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Password must be at least 6 characters.';
    // else return null;
  }

  static String? validateName(String value) {
    var pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = new RegExp(pattern);
    var p1 = r'[0-9.,]+';
    RegExp regex1 = new RegExp(p1);
    if (regex1.hasMatch(value)) return 'Numeric value not allowd.';
    if (!regex.hasMatch(value))
      return 'Please enter a name.';
    // else return null;
  }

  static String? validateNumber(String value) {
    var pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please enter a number.';
    // else return null;
  }

  static String? validateOtp(String value) {
    var pattern = r"^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please enter a OTP.';
    // else return null;
  }
}