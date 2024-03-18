import 'package:flutter/material.dart';
import 'package:ucan/app/navigation/route.dart';
import 'package:ucan/screen/error/error_page.dart';
import 'package:ucan/screen/shared/animate/smart_animate_page_transitions_builder.dart';
import 'package:ucan/screen/splash/splash_screen.dart';
import 'package:ucan/screen/ucan/authentification/view/forgotpass.dart';
import 'package:ucan/screen/ucan/authentification/view/signin.dart';
import 'package:ucan/screen/ucan/authentification/view/signup.dart';

class AppRouter {
  /// To generate route
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute<void>(
          builder: (_) {
            return const SplashScreen();
          },
        );

      case Routes.signin:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );

      case Routes.signup:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignupScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );
        case Routes.forgot:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ForgotPassScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ErrorPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
          transitionDuration:
              const Duration(milliseconds: 300), // Durée de l'animation
        );
    }
  }

  /// mainApp
  static GlobalKey<NavigatorState> mainApp = GlobalKey();

  /// storeApp
  static GlobalKey<NavigatorState> storeApp = GlobalKey();
}
