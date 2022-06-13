import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

late TextInputType textType;

TextInputType keyboard(value) {
  switch (value) {
    case 'field':
      {
        textType = TextInputType.text;
      }
      break;
    case 'email':
      {
        textType = TextInputType.emailAddress;
      }
      break;
    case 'phone':
      {
        textType = TextInputType.number;
      }
      break;
    case 'password':
      {
        textType = TextInputType.text;
      }
      break;
  }
  return textType;
}

String? validField(String? value) => value!.isEmpty ? 'Insert value' : null;

String? validEmail(String? value) =>
    value!.isEmpty || !EmailValidator.validate(value, true)
        ? 'Invalid email'
        : null;

RegExp regex1 = RegExp(r'^\(?\d{3}\)?[-\s]?\d{3}[-\s]?\d{4}$');

String? validPhone(String? value) => value!.isEmpty || !regex1.hasMatch(value)
    ? 'Invalid phone number(10 digits only): \n - 555-555-5555 \n - 5555555555 \n - (555)-555-555'
    : null;
// r'^
// \(?        // can contain a parenthesis
// \d{3}      // should contain 3 numbers
// [-\s]?     // can contain - or space
// \d{3}      // should conatin 4 numbers
// $

RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_-]).{8,15}$');

String? validPassword(String? value) => value!.isEmpty || !regex.hasMatch(value)
    ? 'Invalid password: \n - At least one upper case \n - At least one lower case \n - At least one number \n - At least one special char \n - At least 8 digits long'
    : null;
// r'^
// (?=.*[A-Z])       // should contain at least one upper case
// (?=.*[a-z])       // should contain at least one lower case
// (?=.*?[0-9])      // should contain at least one digit
// (?=.*?[!@#\$&*~]) // should contain at least one Special character
// .{8,}             // Must be at least 8 characters in length
// $