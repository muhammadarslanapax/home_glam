import 'package:flutter/material.dart';

class AppNavigator {
  // A method to navigate to a new screen without removing the previous one
  static Future<T?> push<T>(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // A method to navigate to a new screen and remove the previous one
  static Future<T?> pushReplacement<T>(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // A method to push a new screen and clear the entire navigation stack
  static Future<T?> pushAndRemoveUntil<T>(BuildContext context, Widget page) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false, // Clears all previous routes
    );
  }

  // A method to pop the current screen
  static void pop(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  // A method to pop until a specific screen
  static void popUntil(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  // A method to navigate to a named route
  static Future<T?> pushNamed<T>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  // A method to push replacement to a named route
  static Future<T?> pushReplacementNamed<T>(BuildContext context, String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  // A method to push and remove until a named route
  static Future<T?> pushNamedAndRemoveUntil<T>(BuildContext context, String routeName) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (Route<dynamic> route) => false,
    );
  }

  // A method to pop with a result
  static void popWithResult<T>(BuildContext context, T result) {
    Navigator.pop(context, result);
  }
}
