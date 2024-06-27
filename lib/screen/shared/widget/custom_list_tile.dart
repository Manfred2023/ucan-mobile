import 'package:flutter/material.dart';

import '../../../app/config/colors.dart';
import '../design_system/utils/dimens.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.onTap,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.color,
    this.styleCustom,
  });

  final VoidCallback? onTap;
  final String? title;
  final Color? color;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;
  final TextStyle? styleCustom;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimens.marginSmall,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leading != null) leading!,
            if (leading != null && title != null) Dimens.boxSmall,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Padding(
                      padding: subtitle != null
                          ? const EdgeInsets.only(bottom: 3)
                          : EdgeInsets.zero,
                      child: Text(
                        title!,
                        style: styleCustom ??
                            TextStyle(
                                color: color ?? ColorsApp.textColor,
                                fontSize: 14),
                      ),
                    ),
                  if (subtitle != null && title != null)
                    const SizedBox(
                      height: 4,
                    ),
                  if (subtitle != null) subtitle!,
                ],
              ),
            ),
            if (trailing != null)
              const SizedBox(
                width: 16,
              ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
