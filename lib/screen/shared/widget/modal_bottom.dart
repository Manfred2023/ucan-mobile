//  Created by Jospin MAMBOU on 18/12/2023, 13:32
//  Email websafe21@gmail.com
//  Copyright (c) 2023, All rights reserved
//  Last modified 18/12/2023, 13:32

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/config/colors.dart';
import '../design_system/utils/dimens.dart';
import '../model/responsive.dart';
import '../model/text_form_model.dart';

class ModalService {
  /// Code
  static Future<String?> showTextFieldForm(BuildContext context,
      {required TextEditingController textEditingController,
      required String label,
      required String? Function(String? value) validation,
      required bool isRequired,
      required String save,
      String? description,
      bool? hasActionLeft = false,
      String? auto,
      TextInputType? keyboardType = TextInputType.text,
      TextCapitalization textCapitalization = TextCapitalization.characters,
      int? maxLines = 1,
      int? maxLength,
      List<TextInputFormatter>? inputFormatters}) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return showModalBottomSheet<String?>(
        backgroundColor: ColorsApp.onSecondary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width,
        ),
        barrierColor: Colors.black45,
        builder: (context) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: IntrinsicHeight(
                    //height: MediaQuery.sizeOf(context).height * 0.3,
                    child: Column(
                  children: [
                    Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  hasActionLeft != null && hasActionLeft
                                      ? MainAxisAlignment.spaceBetween
                                      : MainAxisAlignment.end,
                              children: [
                                if (hasActionLeft != null && hasActionLeft)
                                  InkWell(
                                    onTap: () {
                                      textEditingController.text =
                                          DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString();
                                    },
                                    child: Text(
                                      auto ?? '',
                                      style: TextStyle(
                                          color: ColorsApp.greenColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.pop(context,
                                          textEditingController.text.trim());
                                    }
                                  },
                                  child: Text(
                                    save ?? '',
                                    style: TextStyle(
                                        color: ColorsApp.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxLarge,
                            TextFormField(
                                controller: textEditingController,
                                textCapitalization: textCapitalization,
                                readOnly: true,
                                autofocus: true,
                                textInputAction: TextInputAction.done,
                                keyboardType: keyboardType,
                                maxLines: maxLines,
                                maxLength: maxLength,
                                inputFormatters: inputFormatters,
                                onFieldSubmitted: (value) {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.pop(context,
                                        textEditingController.text.trim());
                                  }
                                },
                                style: const TextStyle(
                                    color: ColorsApp.primary,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                                decoration: InputDecoration(
                                  fillColor: ColorsApp.foreground,
                                  filled: true,
                                  counterText: maxLength != null ? '' : null,
                                  errorBorder: const OutlineInputBorder(
                                      gapPadding: 0,
                                      borderSide:
                                          BorderSide(color: ColorsApp.error)),
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorStyle: TextStyle(
                                      fontSize: 14 * Dimens.dp(context)),
                                  hintText: label,
                                  hintStyle: TextStyle(
                                      color: ColorsApp.textColorCC,
                                      fontSize: 14 * Dimens.dp(context)),
                                ),
                                validator: validation),
                            if (description != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimens.marginSmall,
                                    top: Dimens.marginXxSmall,
                                    right: Dimens.marginSmall),
                                child: Text(
                                  description,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12 * Dimens.dp(context),
                                    color: ColorsApp.textColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                          ],
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ))),
          );
        });
  }

  static Future<String?> showTextFieldForm2(BuildContext context,
      {required TextEditingController textEditingController,
      required TextEditingController textEditingController2,
      required String label,
      required String label2,
      required String? Function(String? value) validation,
      required bool isRequired,
      TextInputType? keyboardType = TextInputType.text,
      TextInputType? keyboardType2 = TextInputType.number,
      TextCapitalization textCapitalization = TextCapitalization.characters,
      int? maxLines = 1,
      List<TextInputFormatter>? inputFormatters}) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return showModalBottomSheet<String?>(
        backgroundColor: ColorsApp.onSecondary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width,
        ),
        barrierColor: Colors.black45,
        builder: (context) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: IntrinsicHeight(
                    //height: MediaQuery.sizeOf(context).height * 0.3,
                    child: Column(
                  children: [
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      Navigator.pop(context,
                                          textEditingController.text.trim());
                                    }
                                  },
                                  child: const Text(
                                    'Enregistrer',
                                    style: TextStyle(
                                        color: ColorsApp.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Dimens.boxLarge,
                            TextFormField(
                              controller: textEditingController,
                              textCapitalization: textCapitalization,
                              autofocus: true,
                              textInputAction: TextInputAction.done,
                              keyboardType: keyboardType,
                              maxLines: maxLines,
                              inputFormatters: inputFormatters,
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pop(context,
                                      textEditingController.text.trim());
                                }
                              },
                              //onSaved: (value) => firstNameValue = value,
                              style: const TextStyle(
                                  color: ColorsApp.primary,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                              decoration: InputDecoration(
                                  fillColor: ColorsApp.background,
                                  filled: true,
                                  errorBorder: const OutlineInputBorder(
                                      gapPadding: 0,
                                      borderSide:
                                          BorderSide(color: ColorsApp.error)),
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  label: RichText(
                                    text: TextSpan(
                                        text: label,
                                        children: [
                                          if (isRequired)
                                            const TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    color: ColorsApp.primary))
                                        ],
                                        style: const TextStyle(
                                          color: ColorsApp.textColor,
                                        )),
                                  ),
                                  hintStyle: const TextStyle(
                                      color: ColorsApp.textColor,
                                      fontSize: 14)),
                              validator: validation,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing eli",
                              style: TextStyle(
                                  fontSize: 12, color: ColorsApp.textColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: textEditingController2,
                              textCapitalization: textCapitalization,
                              autofocus: true,
                              textInputAction: TextInputAction.done,
                              keyboardType: keyboardType2,
                              maxLines: maxLines,
                              inputFormatters: inputFormatters,
                              onFieldSubmitted: (value2) {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pop(context,
                                      textEditingController.text.trim());
                                }
                              },
                              //onSaved: (value) => firstNameValue = value,
                              style: const TextStyle(
                                  color: ColorsApp.primary,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          Navigator.pop(
                                              context,
                                              textEditingController2.text
                                                  .trim());
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.check_circle_sharp,
                                        size: 32,
                                        color: ColorsApp.primary,
                                      )),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .black45), // Couleur de la bordure inactif
                                  ),
                                  label: RichText(
                                    text: TextSpan(
                                        text: label2,
                                        children: [
                                          if (isRequired)
                                            const TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    color: ColorsApp.primary))
                                        ],
                                        style: const TextStyle(
                                          color: ColorsApp.textColor,
                                        )),
                                  ),
                                  hintStyle: const TextStyle(
                                      color: ColorsApp.textColor,
                                      fontSize: 14)),
                              validator: validation,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing eli",
                              style: TextStyle(
                                  fontSize: 12, color: ColorsApp.textColor),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ))),
          );
        });
  }

  static Future<String?> showTextFieldForm4FieldsRadio(BuildContext context,
      {required TextEditingController textEditingController,
      required TextEditingController textEditingController2,
      required TextEditingController textEditingController3,
      required String label,
      required String label2,
      required String label3,
      String? description,
      String? description2,
      String? description3,
      required String? Function(
        String? value,
      ) validation,
      required String? Function(
        String? value2,
      ) validation2,
      required String? Function(
        String? value3,
      ) validation3,
      required bool isRequired,
      TextInputType? keyboardType = TextInputType.text,
      TextInputType? keyboardType3 = TextInputType.number,
      int? maxLines = 1,
      List<TextInputFormatter>? inputFormatters}) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return showModalBottomSheet<String?>(
        backgroundColor: ColorsApp.secondary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        isScrollControlled: true,
        barrierColor: Colors.black45,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: IntrinsicHeight(
                  //height: MediaQuery.sizeOf(context).height * 0.3,
                  child: Column(
                children: [
                  Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.pop(context,
                                        textEditingController.text.trim());
                                  }
                                },
                                child: const Text(
                                  'Enregistrer',
                                  style: TextStyle(
                                      color: ColorsApp.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Dimens.boxLarge,
                          TextFormField(
                            controller: textEditingController,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.done,
                            keyboardType: keyboardType,
                            maxLines: maxLines,
                            autofocus: true,
                            inputFormatters: inputFormatters,
                            onFieldSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                Navigator.pop(
                                    context, textEditingController.text.trim());
                              }
                            },
                            //onSaved: (value) => firstNameValue = value,
                            style: const TextStyle(
                                color: ColorsApp.primary,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                            decoration: InputDecoration(
                                fillColor: ColorsApp.background,
                                filled: true,
                                errorBorder: const OutlineInputBorder(
                                    gapPadding: 0,
                                    borderSide:
                                        BorderSide(color: ColorsApp.error)),
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: label,
                                hintStyle: const TextStyle(
                                    color: ColorsApp.textColor, fontSize: 14)),
                            validator: validation,
                          ),
                          if (description != null)
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Dimens.marginSmall,
                                  top: Dimens.marginXxSmall,
                                  right: Dimens.marginSmall),
                              child: Text(
                                description,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsApp.textColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: textEditingController2,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.done,
                            keyboardType: keyboardType,
                            maxLines: maxLines,
                            autofocus: true,
                            inputFormatters: inputFormatters,
                            onFieldSubmitted: (value2) {
                              if (formKey.currentState!.validate()) {
                                Navigator.pop(
                                    context, textEditingController.text.trim());
                              }
                            },
                            //onSaved: (value) => firstNameValue = value,
                            style: const TextStyle(
                                color: ColorsApp.primary,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                            decoration: InputDecoration(
                                fillColor: ColorsApp.background,
                                filled: true,
                                errorBorder: const OutlineInputBorder(
                                    gapPadding: 0,
                                    borderSide:
                                        BorderSide(color: ColorsApp.error)),
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: label2,
                                hintStyle: const TextStyle(
                                    color: ColorsApp.textColor, fontSize: 14)),
                            validator: validation2,
                          ),
                          if (description2 != null)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: Dimens.marginSmall,
                                  top: Dimens.marginXxSmall,
                                  right: Dimens.marginSmall),
                              child: Text(
                                description2,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: ColorsApp.textColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: textEditingController3,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.done,
                            keyboardType: keyboardType3,
                            maxLines: maxLines,
                            autofocus: true,
                            inputFormatters: inputFormatters,
                            onFieldSubmitted: (value3) {
                              if (formKey.currentState!.validate()) {
                                Navigator.pop(
                                    context, textEditingController.text.trim());
                              }
                            },
                            //onSaved: (value) => firstNameValue = value,
                            style: const TextStyle(
                                color: ColorsApp.primary,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                            decoration: InputDecoration(
                                fillColor: ColorsApp.background,
                                filled: true,
                                errorBorder: const OutlineInputBorder(
                                    gapPadding: 0,
                                    borderSide:
                                        BorderSide(color: ColorsApp.error)),
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: label3,
                                hintStyle: const TextStyle(
                                    color: ColorsApp.textColor, fontSize: 14)),
                            validator: validation2,
                          ),
                          if (description3 != null)
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Dimens.marginSmall,
                                  top: Dimens.marginXxSmall,
                                  right: Dimens.marginSmall),
                              child: Text(
                                description3,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsApp.textColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )));
        });
  }

  static List<TextEditingController> _generateTextEditingController(int count) {
    List<TextEditingController> textControllers = [];

    for (int i = 0; i < count; i++) {
      TextEditingController textController = TextEditingController();
      textControllers.add(textController);
    }

    return textControllers;
  }

  static List<Widget> generateTextFields(int count) {
    List<TextEditingController> textControllers =
        _generateTextEditingController(count);
    List<Widget> textFields = [];
    for (int i = 0; i < count; i++) {
      textFields.add(
        TextFormField(
          controller: textControllers[i],
          decoration: InputDecoration(
            labelText: 'Textfield ${i + 1}',
          ),
        ),
      );
    }

    return textFields;
  }

  static Future<List<TextEditingController>?> showMultiTextFieldForm(
    BuildContext context, {
    required List<TextFormModel> textFormModels,
    required GlobalKey<FormState> formKey,
    Color? backgroundColor,
    Widget? actionLeft,
    Widget? actionRight,
  }) {
    return showModalBottomSheet<List<TextEditingController>?>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10 * Dimens.dp(context)),
          topRight: Radius.circular(10 * Dimens.dp(context)),
        )),
        backgroundColor: backgroundColor,
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width,
        ),
        barrierColor: Colors.black45,
        builder: (context) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: Dimens.marginMedium * Dimens.dp(context),
                      right: Dimens.marginMedium * Dimens.dp(context),
                      top: Dimens.marginMedium * Dimens.dp(context),
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (actionLeft != null || actionRight != null)
                        Row(
                          mainAxisAlignment: actionLeft == null
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.spaceBetween,
                          children: [
                            if (actionLeft != null) actionLeft,
                            if (actionRight != null) actionRight,
                          ],
                        ),
                      Dimens.boxMedium,
                      Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (Responsive.isTablet(context))
                                for (int i = 0;
                                    i < textFormModels.length;
                                    i += 2)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (i < textFormModels.length)
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              if (textFormModels[i].typeField ==
                                                  TypeField.text)
                                                TextFormField(
                                                  controller: textFormModels[i]
                                                      .controller,
                                                  autofocus: textFormModels[i]
                                                      .autoFocus,
                                                  onTap:
                                                      textFormModels[i].onTap,
                                                  readOnly: textFormModels[i]
                                                          .readOnly ??
                                                      false,
                                                  textCapitalization:
                                                      textFormModels[i]
                                                              .textCapitalization ??
                                                          TextCapitalization
                                                              .none,
                                                  textInputAction:
                                                      textFormModels[i]
                                                              .textInputAction ??
                                                          TextInputAction.done,
                                                  keyboardType:
                                                      textFormModels[i]
                                                          .keyboardType,
                                                  style: textFormModels[i]
                                                          .style ??
                                                      TextStyle(
                                                        color:
                                                            ColorsApp.primary,
                                                        fontSize: 16 *
                                                            Dimens.dp(context),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                  decoration: textFormModels[i]
                                                      .decoration,
                                                  validator: textFormModels[i]
                                                      .validator,
                                                )
                                              else if (textFormModels[i]
                                                      .typeField ==
                                                  TypeField.dropdown)
                                                textFormModels[i]
                                                    .dropdownButtonFormField!,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: Dimens.marginSmall,
                                                  top: Dimens.marginXxSmall,
                                                ),
                                                child: Text(
                                                  textFormModels[i].desc,
                                                  style: TextStyle(
                                                    fontSize:
                                                        12 * Dimens.dp(context),
                                                    color: ColorsApp.textColor,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Dimens.marginSmall *
                                                    Dimens.dp(context),
                                              )
                                            ],
                                          ),
                                        ),
                                      SizedBox(
                                          width: Dimens.marginSmall *
                                              Dimens.dp(context)),
                                      if (i + 1 < textFormModels.length)
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (textFormModels[i + 1]
                                                      .typeField ==
                                                  TypeField.text)
                                                TextFormField(
                                                  controller:
                                                      textFormModels[i + 1]
                                                          .controller,
                                                  autofocus:
                                                      textFormModels[i + 1]
                                                          .autoFocus,
                                                  textCapitalization:
                                                      textFormModels[i + 1]
                                                              .textCapitalization ??
                                                          TextCapitalization
                                                              .none,
                                                  onTap: textFormModels[i + 1]
                                                      .onTap,
                                                  readOnly:
                                                      textFormModels[i + 1]
                                                              .readOnly ??
                                                          false,
                                                  textInputAction:
                                                      textFormModels[i + 1]
                                                              .textInputAction ??
                                                          TextInputAction.done,
                                                  keyboardType:
                                                      textFormModels[i + 1]
                                                          .keyboardType,
                                                  style: textFormModels[i + 1]
                                                          .style ??
                                                      TextStyle(
                                                        color:
                                                            ColorsApp.primary,
                                                        fontSize: 16 *
                                                            Dimens.dp(context),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                  decoration:
                                                      textFormModels[i + 1]
                                                          .decoration,
                                                  validator:
                                                      textFormModels[i + 1]
                                                          .validator,
                                                )
                                              else if (textFormModels[i + 1]
                                                      .typeField ==
                                                  TypeField.dropdown)
                                                textFormModels[i + 1]
                                                    .dropdownButtonFormField!,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: Dimens.marginSmall,
                                                  top: Dimens.marginXxSmall,
                                                ),
                                                child: Text(
                                                  textFormModels[i + 1].desc,
                                                  style: TextStyle(
                                                    fontSize:
                                                        12 * Dimens.dp(context),
                                                    color: ColorsApp.textColor,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Dimens.marginSmall *
                                                    Dimens.dp(context),
                                              )
                                            ],
                                          ),
                                        ),
                                      /*SizedBox(
                                          width: Dimens.marginSmall *
                                              Dimens.dp(context)),
                                      if (i + 2 < textFormModels.length)
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (textFormModels[i + 2]
                                                      .typeField ==
                                                  TypeField.text)
                                                TextFormField(
                                                  controller:
                                                      textFormModels[i + 2]
                                                          .controller,
                                                  autofocus:
                                                      textFormModels[i + 2]
                                                          .autoFocus,
                                                  textCapitalization:
                                                      textFormModels[i + 2]
                                                              .textCapitalization ??
                                                          TextCapitalization
                                                              .none,
                                                  textInputAction:
                                                      textFormModels[i + 2]
                                                              .textInputAction ??
                                                          TextInputAction.done,
                                                  keyboardType:
                                                      textFormModels[i + 2]
                                                          .keyboardType,
                                                  style: textFormModels[i + 2]
                                                          .style ??
                                                      TextStyle(
                                                        color:
                                                            ColorsApp.primary,
                                                        fontSize: 16 *
                                                            Dimens.dp(context),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                  decoration:
                                                      textFormModels[i + 2]
                                                          .decoration,
                                                  validator:
                                                      textFormModels[i + 2]
                                                          .validator,
                                                )
                                              else if (textFormModels[i + 2]
                                                      .typeField ==
                                                  TypeField.dropdown)
                                                ButtonTheme(
                                                  alignedDropdown: true,
                                                  child: textFormModels[i + 2]
                                                      .dropdownButtonFormField!,
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: Dimens.marginSmall,
                                                  top: Dimens.marginXxSmall,
                                                ),
                                                child: Text(
                                                  textFormModels[i + 2].desc,
                                                  style: TextStyle(
                                                    fontSize:
                                                        12 * Dimens.dp(context),
                                                    color: ColorsApp.textColor,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: Dimens.marginSmall *
                                                    Dimens.dp(context),
                                              )
                                            ],
                                          ),
                                        ),*/
                                    ],
                                  )
                              else
                                for (final textFormModel in textFormModels)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (textFormModel.typeField ==
                                          TypeField.text)
                                        TextFormField(
                                          controller: textFormModel.controller,
                                          autofocus: textFormModel.autoFocus,
                                          textCapitalization: textFormModel
                                                  .textCapitalization ??
                                              TextCapitalization.none,
                                          textInputAction:
                                              textFormModel.textInputAction ??
                                                  TextInputAction.done,
                                          onTap: textFormModel.onTap,
                                          readOnly:
                                              textFormModel.readOnly ?? false,
                                          keyboardType:
                                              textFormModel.keyboardType,
                                          style: textFormModel.style ??
                                              TextStyle(
                                                  color: ColorsApp.primary,
                                                  fontSize:
                                                      16 * Dimens.dp(context),
                                                  fontWeight: FontWeight.w700),
                                          decoration: textFormModel.decoration,
                                          validator: textFormModel.validator,
                                        )
                                      else if (textFormModel.typeField ==
                                          TypeField.dropdown)
                                        ButtonTheme(
                                          alignedDropdown: true,
                                          child: textFormModel
                                              .dropdownButtonFormField!,
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: Dimens.marginSmall,
                                            top: Dimens.marginXxSmall),
                                        child: Text(
                                          textFormModel.desc,
                                          style: TextStyle(
                                            fontSize: 12 * Dimens.dp(context),
                                            color: ColorsApp.textColor,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimens.marginSmall *
                                            Dimens.dp(context),
                                      )
                                    ],
                                  ),
                            ],
                          )),
                      SizedBox(
                        height: 40 * Dimens.dp(context),
                      ),
                    ],
                  )),
            ),
          );
        });
  }
}
