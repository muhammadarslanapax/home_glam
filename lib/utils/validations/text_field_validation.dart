import 'package:flutter/material.dart';

mixin TextFieldValidation {
   
   GlobalKey<FormState> globalKey = GlobalKey();


  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null; 
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!RegExp(r'[A-Za-z0-9]').hasMatch(value)) {
      return 'Password must contain at least one letter and one number';
    }
    return null; 
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; 
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
      return 'Enter a valid phone number (10-15 digits)';
    }
    return null; 
  }
}
