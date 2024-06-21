import 'package:flutter/material.dart';

import '../utils/dimens.dart';
import 'ds_loading_indicator.dart';

class DSPrimaryButton extends StatelessWidget {
  const DSPrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.height,
    this.backgroundColor,
    this.isLoading = false,
    this.enabled = true,
    this.width = double.infinity,
    this.forceUpperCase = true,
    this.borderRadius,
    this.contentPadding,
  }) : super(key: key);
  final String text;
  final double width;
  final double? height;
  final Color? backgroundColor;
  final bool isLoading;
  final TextStyle? textStyle;
  final bool enabled;
  final VoidCallback? onPressed;
  final bool forceUpperCase;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      enabled: enabled,
      width: width,
      height: height,
      textStyle: textStyle,
      borderSide: BorderSide.none,
      defaultColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      disabledColor: backgroundColor != null
          ? backgroundColor!.withOpacity(0.25)
          : Theme.of(context).colorScheme.primary.withOpacity(0.25),
      defaultTextColor: Theme.of(context).colorScheme.onPrimary,
      disabledTextColor:
          Theme.of(context).colorScheme.onSurface.withOpacity(0.30),
      loadingColor: Theme.of(context).colorScheme.onPrimary,
      forceUpperCase: forceUpperCase,
      borderRadius: borderRadius,
      contentPadding: contentPadding,
    );
  }
}

class DSOutlineButton extends StatelessWidget {
  const DSOutlineButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width = double.infinity,
    this.forceUpperCase = true,
    this.borderRadius,
    this.contentPadding,
  }) : super(key: key);
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onPressed;
  final bool forceUpperCase;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return _BaseButton(
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      enabled: enabled,
      width: width,
      borderSide: BorderSide(
        color: (enabled || isLoading)
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).disabledColor,
        width: Dimens.borderSmall,
      ),
      defaultColor: const Color.fromARGB(0, 0, 0, 0),
      disabledColor: const Color.fromARGB(0, 0, 0, 0),
      defaultTextColor: Theme.of(context).colorScheme.primary,
      disabledTextColor: Theme.of(context).disabledColor,
      loadingColor: Theme.of(context).colorScheme.primary,
      forceUpperCase: forceUpperCase,
      borderRadius: borderRadius,
      contentPadding: contentPadding,
    );
  }
}

class DSTextButton extends StatelessWidget {
  const DSTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.alignment = Alignment.centerLeft,
    this.horizontalMargin = 0.0,
    this.loadingColor,
    this.height,
    this.textStyle,
    this.defaultTextColor,
    this.disabledTextColor,
    this.forceUpperCase = true,
  }) : super(key: key);
  final String text;
  final double? width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onPressed;
  final Alignment alignment;
  final double horizontalMargin;

  final Color? loadingColor;
  final double? height;
  final TextStyle? textStyle;
  final Color? defaultTextColor;
  final Color? disabledTextColor;
  final bool forceUpperCase;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? Dimens.buttonHeight,
      child: Align(
          alignment: alignment,
          child: DSLoadingIndicator(
            color: loadingColor ?? Theme.of(context).colorScheme.primary,
          )),
    );
  }
}

class _BaseButton extends StatelessWidget {
  const _BaseButton({
    Key? key,
    required this.text,
    required this.isLoading,
    required this.enabled,
    required this.width,
    required this.borderSide,
    required this.loadingColor,
    required this.defaultColor,
    required this.disabledColor,
    required this.defaultTextColor,
    required this.disabledTextColor,
    required this.forceUpperCase,
    this.contentPadding,
    this.height,
    this.textStyle,
    this.borderRadius,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final double width;
  final bool isLoading;
  final bool enabled;
  final VoidCallback? onPressed;

  final Color? loadingColor;
  final double? height;
  final double? borderRadius;
  final Color defaultColor;
  final Color disabledColor;
  final TextStyle? textStyle;
  final BorderSide borderSide;
  final Color defaultTextColor;
  final Color? disabledTextColor;
  final bool forceUpperCase;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? Dimens.buttonHeight,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? Dimens.radiusMedium,
              ),
              side: borderSide,
            ),
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledTextColor ??
                    Theme.of(context).colorScheme.onSurface.withOpacity(.30);
              } else {
                return disabledTextColor;
              }
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return isLoading ? defaultColor : disabledColor;
              } else {
                return defaultColor;
              }
            },
          ),
          overlayColor: MaterialStatePropertyAll(
            (!enabled || isLoading) ? const Color.fromARGB(0, 0, 0, 0) : null,
          ),
        ),
        onPressed: (enabled && !isLoading) ? onPressed : null,
        child: Center(
          child: isLoading
              ? DSLoadingIndicator(
                  color:
                      loadingColor ?? Theme.of(context).colorScheme.onPrimary,
                )
              : Padding(
                  padding: contentPadding ?? EdgeInsets.zero,
                  child: Text(
                    forceUpperCase ? text.toUpperCase() : text,
                    style: textStyle,
                  ),
                ),
        ), // null == default
      ),
    );
  }
}
