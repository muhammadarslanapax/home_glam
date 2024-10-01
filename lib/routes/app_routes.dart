import 'package:flutter/material.dart';
import 'package:home_glam/animations/routes_animation.dart';
import 'package:home_glam/routes/routes_name.dart';
import 'package:home_glam/views/AUTHORIZATION/signup_screen.dart';
import 'package:home_glam/views/locationAndRole_screen.dart';
import 'package:home_glam/views/onBoarding_screen.dart';
import 'package:home_glam/views/splash_screen.dart';

class AppRouteGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return rightToLeftRouteAnimation(const SplashScreen());

      case RoutesName.onboarding:
        return rightToLeftRouteAnimation(const OnboardingScreen());

      case RoutesName.selectLocationScreen:
        return rightToLeftRouteAnimation(const LocationandroleScreen());

      case RoutesName.signupRoute:
        return rightToLeftRouteAnimation(const SignupScreen());

      default:
        // Handle undefined routes
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
