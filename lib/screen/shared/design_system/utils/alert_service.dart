import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ucan/app/config/constant.dart';

import '../../../../app/config/colors.dart';

class AlertService {
  AlertService._();

  static const int _durationSeconds = 3;
  static const int _durationWithActionsSeconds = 6;

  static void showAlert({
    required BuildContext context,
    required String message,
    String? title,
    int? seconds,
    String? actionText,
    String? actionLeftText,
    String? actionRightText,
    Widget? content,
    VoidCallback? onAction,
    VoidCallback? onPressRight,
    VoidCallback? onPressLeft,
    Color? backgroundColor,
    Color? actionTextColor,
    double? snackBarElevation,
    ShapeBorder? snackBarShape,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    TextAlign? textAlign,
    bool isBarrier = true,
    bool withBarrierColor = false,
    AlertType type = AlertType.topBar,
  }) {
    seconds = seconds ??
        (onAction == null ? _durationSeconds : _durationWithActionsSeconds);
    switch (type) {
      case AlertType.topBar:
        Flushbar<dynamic>(
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle:
              margin != null ? FlushbarStyle.FLOATING : FlushbarStyle.GROUNDED,
          animationDuration: const Duration(milliseconds: 500),
          margin: margin?.resolve(TextDirection.ltr) ?? EdgeInsets.zero,
          padding:
              padding?.resolve(TextDirection.ltr) ?? const EdgeInsets.all(16),
          titleText: title == null
              ? null
              : Text(
                  title,
                  textAlign: textAlign ?? TextAlign.center,
                ),
          messageText: Text(
            message,
            textAlign: textAlign ?? TextAlign.center,
          ),
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
          duration: Duration(seconds: seconds),
          onTap: (_) => onAction!(),
          mainButton: (onAction != null && actionText != null)
              ? TextButton(
                  onPressed: onAction,
                  child: Text(
                    actionText,
                  ),
                )
              : null,
        ).show(context);
        break;
      case AlertType.snackBar:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            elevation: snackBarElevation,
            shape: snackBarShape,
            margin: margin,
            padding: padding,
            duration: Duration(seconds: seconds),
            backgroundColor: backgroundColor,
            content: Text(
              message,
              textAlign: textAlign,
            ),
            action: (onAction != null && actionText != null)
                ? SnackBarAction(
                    label: actionText,
                    onPressed: onAction,
                    textColor: actionTextColor ??
                        Theme.of(context).colorScheme.primary,
                  )
                : null,
          ),
        );
        break;
      case AlertType.modalInfo:
        showDialog<void>(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: ColorsApp.onBackgroundDark,
                  titlePadding: EdgeInsets.zero,
                  buttonPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  title: title != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                title,
                                style: const TextStyle(
                                  color: ColorsApp.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey[300],
                              thickness: 1,
                              height: 0,
                            ),
                          ],
                        )
                      : null,
                  content: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          message,
                          style: const TextStyle(
                              color: ColorsApp.secondary,
                              fontFamily: Constants.patrickHand,
                              fontSize: 22,
                              height: 1.2),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      height: 0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'OK',
                            style: TextStyle(
                                color: ColorsApp.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
        break;
      case AlertType.modalAction:
        showDialog<void>(
          barrierColor: ColorsApp.background,
          barrierDismissible: isBarrier,
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: ColorsApp.onBackgroundDark,
                  titlePadding: EdgeInsets.zero,
                  buttonPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  title: title != null
                      ? Container(
                          decoration: const BoxDecoration(
                              color: ColorsApp.secondary,
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0))),
                          //width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: ColorsApp.surface,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ))
                      : null,
                  content: content,
                );
              },
            );
          },
        );
        break;
      case AlertType.modalDoubleAction:
        showDialog<void>(
          barrierColor:
              withBarrierColor ? ColorsApp.background : Colors.black54,
          barrierDismissible: isBarrier,
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                  backgroundColor: ColorsApp.onBackgroundDark,
                  titlePadding: EdgeInsets.zero,
                  buttonPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  title: title != null
                      ? Container(
                          decoration: const BoxDecoration(
                              color: ColorsApp.secondary,
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0))),
                          //width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: ColorsApp.surface,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ))
                      : null,
                  content: content,
                  actions: [
                    // Divider(
                    //   color: Colors.grey[300],
                    //   thickness: 1,
                    //   height: 0,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorsApp.textColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: TextButton(
                              onPressed: onPressLeft,
                              child: Text(
                                actionLeftText ?? '',
                                style: const TextStyle(
                                  color: Color(0xff464646),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            /*
                          color: Colors.grey[300],
                          height: 50,
                          width: 2,*/
                            ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorsApp.secondary,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: TextButton(
                              onPressed: onPressRight,
                              child: Text(
                                actionRightText ?? '',
                                style: const TextStyle(
                                  color: ColorsApp.onPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        );
        break;
    }
  }

  static void showWarringSession({
    required BuildContext context,
    required String message,
    required String? title,
  }) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                backgroundColor: ColorsApp.onBackgroundDark,
                titlePadding: EdgeInsets.zero,
                buttonPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                title: title != null
                    ? Container(
                        decoration: const BoxDecoration(
                            color: ColorsApp.primary,
                            //shape: BoxShape.circle,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0))),
                        //width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: ColorsApp.surface,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ))
                    : null,
                content: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        message,
                        style: const TextStyle(
                            color: ColorsApp.secondary,
                            fontFamily: 'PatrickHand',
                            fontSize: 22,
                            height: 1.2),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              'OK',
                              style: TextStyle(
                                  color: ColorsApp.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void updateApp({
    required BuildContext context,
    required String message,
    required String? title,
  }) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                backgroundColor: ColorsApp.onBackgroundDark,
                titlePadding: EdgeInsets.zero,
                buttonPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                title: title != null
                    ? Container(
                        decoration: const BoxDecoration(
                            color: ColorsApp.primary,
                            //shape: BoxShape.circle,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0))),
                        //width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: ColorsApp.surface,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ))
                    : null,
                content: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        message,
                        style: const TextStyle(
                            color: ColorsApp.secondary,
                            fontFamily: 'PatrickHand',
                            fontSize: 22,
                            height: 1.2),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              'OK',
                              style: TextStyle(
                                  color: ColorsApp.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static void showSnack(BuildContext context,
      {required String message,
      bool isSuccess = false,
      required VoidCallback onPressed,
      required String actionText}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: isSuccess ? ColorsApp.greenColor : Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(30),
          content: Text(
            message,
            style: const TextStyle(
                fontSize: 18, fontFamily: Constants.patrickHand),
          ),
          action: SnackBarAction(
            label: actionText,
            textColor: ColorsApp.onPrimary,
            onPressed: onPressed,
          ),
          duration: const Duration(days: 2),
        ),
      );
  }

  static void showLoad(BuildContext context) {
    AlertDialog alert = const AlertDialog(
      backgroundColor: ColorsApp.secondary,
      titlePadding: EdgeInsets.all(0.0),
      buttonPadding: EdgeInsets.all(0.0),
      contentPadding:
          EdgeInsets.only(left: 15.0, top: 11.0, right: 15.0, bottom: 15.0),
      actionsPadding: EdgeInsets.only(right: 15, left: 15),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularProgressIndicator(
            color: ColorsApp.primary,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              'Veuillez patienter le temps que nous effectuons cette operation',
              style: TextStyle(color: ColorsApp.onSecondary),
            ),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: ColorsApp.background,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }
}

enum AlertType { topBar, snackBar, modalInfo, modalAction, modalDoubleAction }
