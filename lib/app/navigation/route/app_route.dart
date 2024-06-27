import 'package:flutter/material.dart';
import 'package:ucan/app/navigation/route.dart';
import 'package:ucan/data/authentication/model/authentication.dart';
import 'package:ucan/screen/error/error_page.dart';
import 'package:ucan/screen/shared/animate/smart_animate_page_transitions_builder.dart';
import 'package:ucan/screen/splash/splash_screen.dart';

import '../../../screen/authentification/view/forget_password.dart';
import '../../../screen/authentification/view/login_S1.dart';
import '../../../screen/authentification/view/login_S2.dart';
import '../../../screen/authentification/view/signup_S1.dart';
import '../../../screen/authentification/view/signup_S2.dart';
import '../../../screen/authentification/view/welcome.dart';
import '../../../screen/authentification/widget/select_city.dart';
import '../../../screen/authentification/widget/select_country.dart';
import '../../../screen/home/view/paiement.dart';
import '../../../screen/home/view/ucan_account.dart';
import '../../../screen/home/view/ucan_notif.dart';
import '../../../screen/home/view/ucan_view.dart';
import '../../../screen/home/view/widget/select_motif.dart';

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

      case Routes.loginStep1:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginStepOneScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );
      case Routes.paiement:
        final object = routeSettings.arguments! as List<dynamic>;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PaiementSreen(
            object: object,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );

      case Routes.loginStep2:
        final user = routeSettings.arguments! as Authentication;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginStepTwoScreen(
            user: user,
          ),
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

      case Routes.selectMotif:
        return MaterialPageRoute<void>(
          builder: (_) => const SelectMotif(),
        );

      case Routes.selectCity:
        if (routeSettings.arguments == null) {
          return MaterialPageRoute<void>(builder: (_) => const SelectCity());
        }
        final codeCountry = routeSettings.arguments! as String;
        return MaterialPageRoute<void>(
          builder: (_) => SelectCity(),
        );
      case Routes.signup1:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignupOneScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SmartAnimateTransition(
              animation: animation,
              curve: Curves.easeOut, // Courbe ease-out
              child: child,
            );
          },
        );
      case Routes.signup2:
        if (routeSettings.arguments == null) {
          return MaterialPageRoute<void>(builder: (_) => const ErrorPage());
        }
        final contact = routeSettings.arguments! as Contact;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SignupTwoScreen(
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

      case Routes.ucan:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const UcanHomeScreen(),
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
