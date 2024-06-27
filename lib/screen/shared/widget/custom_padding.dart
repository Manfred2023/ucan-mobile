import 'package:flutter/material.dart';

import '../design_system/utils/dimens.dart';

class CustomPadding extends StatelessWidget {
  const CustomPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.marginSmall),
        child: child);
  }
}
