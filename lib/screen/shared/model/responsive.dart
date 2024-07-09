import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
  }) : super(key: key);

  static double tabletSize = 600;
  static double mobileSize = 300;
  static double xl = 1280;
  static double lg = 1024;
  static double md = 768;
  static double sm = 640;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth < tabletSize) {
        return mobile;
      }
      return tablet;
    });
  }
}
