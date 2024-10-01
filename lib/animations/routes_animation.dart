import 'package:flutter/material.dart';

// Custom right-to-left transition animation
Route rightToLeftRouteAnimation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start from the right (1.0 means right)
      const end = Offset.zero; // End at the current position
      const curve = Curves.easeInOut;

      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}


// Custom fade transition animation
Route fadeRouteAnimation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOut;

      final tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
      final fadeAnimation = animation.drive(tween);

      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
  );
}