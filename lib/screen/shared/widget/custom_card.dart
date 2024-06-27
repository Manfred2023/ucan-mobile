import 'package:flutter/material.dart';

import '../../../app/config/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child, this.radius});

  final Widget child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: ColorsApp.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 0)),
        margin: EdgeInsets.zero,
        child: child);
  }
}
