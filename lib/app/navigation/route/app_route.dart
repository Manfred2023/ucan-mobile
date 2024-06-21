import 'package:flutter/material.dart';
import 'package:ucan/app/navigation/route.dart';
import 'package:ucan/data/authentication/model/authentication.dart';
import 'package:ucan/screen/error/error_page.dart';
import 'package:ucan/screen/shared/animate/smart_animate_page_transitions_builder.dart';
import 'package:ucan/screen/splash/splash_screen.dart';

import '../../../screen/authentification/view/check_number.dart';
import '../../../screen/authentification/view/create_account.dart';
import '../../../screen/authentification/view/forget_password.dart';
import '../../../screen/authentification/view/login.dart';
import '../../../screen/authentification/view/welcome.dart';
import '../../../screen/authentification/widget/select_city.dart';
import '../../../screen/authentification/widget/select_country.dart';
import '../../../screen/home/view/ucan_account.dart';
import '../../../screen/home/view/ucan_notif.dart';
import '../../../screen/home/view/ucan_view.dart';

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
      case Routes.selectCountry:
        return MaterialPageRoute<void>(
          builder: (_) => const SelectCountry(),
        );

      case Routes.selectCity:
        if (routeSettings.arguments == null) {
          return MaterialPageRoute<void>(builder: (_) => const SelectCity());
        }
        final codeCountry = routeSettings.arguments! as String;
        return MaterialPageRoute<void>(
          builder: (_) => SelectCity(),
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

      case Routes.code:
        if (routeSettings.arguments == null) {
          return MaterialPageRoute<void>(builder: (_) => const ErrorPage());
        }
        final contact = routeSettings.arguments! as Contact;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CheckNumberScreen(
            contact: contact,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );
      case Routes.ucan:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const UcanScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );
      case Routes.notif:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const NotifScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );
      case Routes.account:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AccountScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );
      case Routes.welcome:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Welcome(),
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
